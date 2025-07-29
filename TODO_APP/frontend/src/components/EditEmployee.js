import React, { useState, useEffect } from 'react';
import { useNavigate, useParams } from 'react-router-dom';
import axios from 'axios';
import { toast } from 'react-toastify';

axios.defaults.baseURL = 'http://localhost:5000/api'; // Set the base URL for all requests

const EditEmployee = () => {
  const { id } = useParams();  // Get employee id from URL
  const navigate = useNavigate();

  const [form, setForm] = useState({
    firstName: '',
    lastName: '',
    email: '',
    salary: '',
  });

  const [errors, setErrors] = useState({});
  const [loading, setLoading] = useState(false); // To handle loading state

  // Load employee data when component mounts
  useEffect(() => {
    // Fetch employee data by ID
    axios.get(`/employees/${id}`)
      .then((response) => {
        // Populate form fields with employee data
        setForm(response.data);
      })
      .catch((error) => {
        toast.error('Failed to load employee data');
        navigate('/employees');  // Redirect to employees list if employee data is not found
      });
  }, [id, navigate]);

  const onChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const validate = () => {
    const newErrors = {};
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!form.firstName.trim()) newErrors.firstName = 'First name is required';
    if (!form.lastName.trim()) newErrors.lastName = 'Last name is required';
    if (!form.email.trim()) newErrors.email = 'Email is required';
    else if (!emailRegex.test(form.email)) newErrors.email = 'Invalid email format';
    if (!form.salary) newErrors.salary = 'Salary is required';
    else if (isNaN(form.salary) || Number(form.salary) <= 0)
      newErrors.salary = 'Enter a valid salary';

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const onSubmit = (e) => {
    e.preventDefault();
    if (!validate()) return;

    setLoading(true); // Start loading

    axios
      .put(`/employees/${id}`, form)  // Send a PUT request to update employee data by ID
      .then(() => {
        toast.success('Employee updated successfully');
        navigate('/employees');  // Redirect to employee list
      })
      .catch((err) => {
        console.error('Error during employee update:', err);  // Log the full error response
        if (err.response) {
          if (err.response.status === 409) {
            setErrors((prev) => ({ ...prev, email: 'Email already exists' }));
          } else {
            toast.error(`Failed to update employee: ${err.response.data.message || err.message}`);
          }
        } else {
          toast.error('Network error or server is down');
        }
      })
      .finally(() => {
        setLoading(false); // End loading
      });
  };

  return (
    <div className="container mt-4">
      <h2>Edit Employee</h2>
      <form onSubmit={onSubmit} noValidate>
        {['firstName', 'lastName', 'email', 'salary'].map((field) => (
          <div className="mb-3" key={field}>
            <input
              name={field}
              type={field === 'salary' ? 'number' : field === 'email' ? 'email' : 'text'}
              className={`form-control ${errors[field] ? 'is-invalid' : ''}`}
              placeholder={field.charAt(0).toUpperCase() + field.slice(1)}
              value={form[field]} // Pre-fill fields with the current employee's data
              onChange={onChange}
            />
            {errors[field] && <div className="invalid-feedback">{errors[field]}</div>}
          </div>
        ))}
        <button className="btn btn-success" disabled={loading}>
          {loading ? <i className="fas fa-spinner fa-spin"></i> : <i className="fas fa-check"></i>}
          {loading ? 'Submitting...' : 'Save Changes'}
        </button>
      </form>
    </div>
  );
};

export default EditEmployee;
