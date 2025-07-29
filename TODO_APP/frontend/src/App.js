import React from 'react';
import { Route, Routes } from 'react-router-dom';
import Login from './components/Login';
import EmployeeList from './components/EmployeeList';
import AddEmployee from './components/AddEmployee';
import EditEmployee from './components/EditEmployee';
import { ToastContainer } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

const App = () => {
  return (
    <>
      <ToastContainer position="top-right" />
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/employees" element={<EmployeeList />} />
        <Route path="/add" element={<AddEmployee />} />
        <Route path="/edit/:id" element={<EditEmployee />} />
      </Routes>
    </>
  );
};

export default App;
