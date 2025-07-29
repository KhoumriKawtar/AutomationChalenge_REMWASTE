import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import { toast } from 'react-toastify';

const AddEmployee = () => {
  const [form, setForm] = useState({
    firstName: '',
    lastName: '',
    email: '',
    salary: '',
  });

  const [errors, setErrors] = useState({});
  const nav = useNavigate();

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

    axios
      .post('http://localhost:5000/api/employees', form)
      .then(() => {
        toast.success('Employee added successfully');
        nav('/employees');
      })
      .catch((err) => {
        if (err.response && err.response.status === 409) {
          setErrors((prev) => ({ ...prev, email: 'Email already exists' }));
        } else {
          toast.error('Failed to add employee');
        }
      });
  };

  return (
    <div className="container mt-4">
      <h2>Add Employee</h2>
      <form onSubmit={onSubmit} noValidate>
        {['firstName', 'lastName', 'email', 'salary'].map((field) => (
          <div className="mb-3" key={field}>
            <input
              name={field}
              type={field === 'salary' ? 'number' : field === 'email' ? 'email' : 'text'}
              className={`form-control ${errors[field] ? 'is-invalid' : ''}`}
              placeholder={field.charAt(0).toUpperCase() + field.slice(1)}
              value={form[field]}
              onChange={onChange}
            />
            {errors[field] && (
              <div className="invalid-feedback">{errors[field]}</div>
            )}
          </div>
        ))}
        <button className="btn btn-success">
          <i className="fas fa-check"></i> Submit
        </button>
      </form>
    </div>
  );
};

export default AddEmployee;
