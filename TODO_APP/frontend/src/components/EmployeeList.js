import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import { toast } from 'react-toastify';
const EmployeeList = () => {
  const [employees, setEmployees] = useState([]);
  const nav = useNavigate();

  useEffect(() => {
    axios.get('http://localhost:5000/api/employees')
      .then(res => setEmployees(res.data))
      .catch(err => console.error(err));
  }, []);

 const deleteEmployee = (id) => {
  axios.delete(`http://localhost:5000/api/employees/${id}`)
    .then(() => {
      setEmployees(employees.filter(emp => emp.id !== id));  // Correct comparison: `emp.id !== id`
    })
    .catch(err => {
      console.error('Error deleting employee:', err);
      toast.error('Failed to delete employee');
    });
};

  return (
    <div className="container mt-5">
      <div className="d-flex justify-content-between align-items-center mb-3">
        <h2>Employee Management Software</h2>
        <div>
          <button onClick={() => nav('/add')} className="btn btn-primary me-2">Add Employee</button>
          <button
            className="btn btn-secondary"
                onClick={() => {
                localStorage.removeItem('auth'); // or 'token', depending on what you store
                // sessionStorage.removeItem(...) if you're using that instead

                // Redirect to login
                nav('/login');
  }
  }
>
  Logout
</button>

        </div>
      </div>

      <table className="table table-bordered">
        <thead className="table-light">
          <tr>
            <th>No.</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Salary</th>
            <th>Date</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {employees.map((emp, idx) => (
            <tr key={emp._id}>
              <td>{idx + 1}</td>
              <td>{emp.firstName}</td>
              <td>{emp.lastName}</td>
              <td>{emp.email}</td>
              <td>${parseInt(emp.salary).toLocaleString()}</td>
              <td>
                {emp.createdAt && !isNaN(new Date(emp.createdAt))
                  ? new Date(emp.createdAt).toISOString().split('T')[0]
                  : 'N/A'}
              </td>
              <td>
                <button
                  onClick={() => nav(`/edit/${emp.id}`)}
                  className="btn btn-sm btn-outline-primary me-2"
                >
                  Edit
                </button>
                <button
                  onClick={() => deleteEmployee(emp.id)}
                  className="btn btn-sm btn-outline-danger"
                >
                  Delete
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default EmployeeList;
