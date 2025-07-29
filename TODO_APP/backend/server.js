const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

let employees = [
  { id: 1, firstName: 'John', lastName: 'Doe', email: 'john.doe@example.com', salary: 50000 },
];

app.get('/api/employees', (req, res) => res.json(employees));

// GET single employee by id
app.get('/api/employees/:id', (req, res) => {
  const emp = employees.find(e => e.id == req.params.id);
  if (!emp) return res.status(404).json({ error: 'Employee not found' });
  res.json(emp);
});

app.post('/api/employees', (req, res) => {
  const { firstName, lastName, email, salary } = req.body;

  if (!firstName || !lastName || !email || !salary) {
    return res.status(400).json({ error: 'All fields required' });
  }

  // 🔍 Check if email already exists
  const emailExists = employees.some(emp => emp.email.toLowerCase() === email.toLowerCase());
  if (emailExists) {
    return res.status(409).json({ error: 'Email already exists' }); // 409 = Conflict
  }
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
if (!emailRegex.test(email)) {
  return res.status(400).json({ message: 'Invalid email format' });
}

  const newEmp = {
    id: employees.length + 1,
    firstName,
    lastName,
    email,
    salary,
  };

  employees.push(newEmp);
  res.status(201).json(newEmp);
});

app.put('/api/employees/:id', (req, res) => {
  const emp = employees.find(e => e.id == req.params.id);
  if (!emp) return res.status(404).json({ error: 'Not found' });
  Object.assign(emp, req.body); // Update employee object with new data
  res.json(emp); // Send back the updated employee object
});

app.delete('/api/employees/:id', (req, res) => {
  employees = employees.filter(e => e.id != req.params.id);
  res.json({ message: 'Deleted' });
});

app.listen(5000, () => console.log('Server running at http://localhost:5000'));
