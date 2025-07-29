import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const Login = () => {
  // Declare states for email, password, and error messages
  const [email, setEmail] = useState('');
  const [pass, setPass] = useState('');
  const [emailError, setEmailError] = useState('');
  const [passError, setPassError] = useState('');
  const [credentialsError, setCredentialsError] = useState('');

  const navigate = useNavigate();

  // Handle login form submission
  const handleLogin = (e) => {
    e.preventDefault(); // Prevent form submission

    // Clear previous errors
    setEmailError('');
    setPassError('');
    setCredentialsError('');

    let formIsValid = true;

    // Check for missing or invalid email
    if (!email) {
      setEmailError('Email is required');
      formIsValid = false;
    } else {
      const emailRegex = /\S+@\S+\.\S+/;
      if (!emailRegex.test(email)) {
        setEmailError('Invalid email format');
        formIsValid = false;
      }
    }

    // Check for missing password
    if (!pass) {
      setPassError('Password is required');
      formIsValid = false;
    }

    // Check credentials (for correct login)
    if (email && pass) {
      if (email !== 'user@example.com') {
        setCredentialsError('Invalid email');
        formIsValid = false;
      } else if (pass !== 'password') {
        setCredentialsError('Invalid password');
        formIsValid = false;
      }
    }

    // If form has any errors, stop the form from submitting
    if (!formIsValid) {
      return; // Don't proceed to login if there are errors
    }

    // Simulate successful login if no errors
    navigate('/employees');
  };

  return (
    <div style={{ minHeight: '100vh', backgroundColor: '#f0f4f8' }}>
      <header style={{ backgroundColor: '#007bff', color: 'white', padding: '1rem 0' }}>
        <h2 className="text-center m-0">Welcome to Employee Portal</h2>
      </header>

      <div className="d-flex justify-content-center align-items-center" style={{ height: '80vh' }}>
        <form
          onSubmit={handleLogin}
          className="p-4 rounded shadow"
          style={{ width: '100%', maxWidth: '400px', backgroundColor: '#ffffff' }}
        >
          <h4 className="text-center mb-4">Login</h4>

          {/* Display individual error messages */}
          {emailError && (
            <div className="alert alert-danger" id="login-email-error-message">
              {emailError}
            </div>
          )}
          {passError && (
            <div className="alert alert-danger" id="login-password-error-message">
              {passError}
            </div>
          )}
          {credentialsError && (
            <div className="alert alert-danger" id="login-credentials-error-message">
              {credentialsError}
            </div>
          )}

          <div className="mb-3">
            <input
              type="email"
              className="form-control"
              placeholder="Email"
              name="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              required
            />
          </div>

          <div className="mb-3">
            <input
              type="password"
              className="form-control"
              placeholder="Password"
              name="password"
              value={pass}
              onChange={(e) => setPass(e.target.value)}
              required
            />
          </div>

          <button className="btn btn-primary w-100">Login</button>
        </form>
      </div>
    </div>
  );
};

export default Login;
