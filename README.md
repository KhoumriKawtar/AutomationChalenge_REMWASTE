# ✅ README.md

## 📝 Project Overview
This is a simple web-based Employee Management application built using React (frontend) and Node.js (backend). The app allows users to:
- Log in using an email and password
- Create new employees
- Edit employee details
- Delete employees
- View the employee list

Each employee record consists of:
- First Name
- Last Name
- Email
- Salary
  
To test this app, I’ve used Robot Framework, as it is a versatile tool that supports both UI (frontend) and API testing. This allows for seamless automation of the entire workflow, from logging in to interacting with the employee list.

## Why Robot Framework?
I chose Robot Framework because I’m comfortable using it, and it works well for both UI and API testing. It also integrates easily with Selenium for UI interactions and RequestsLibrary for API testing, making it an ideal choice for this project.

---

## 🚀 Project Structure
```
AutomationChallenge_REMWASTE/
└── TODO_APP/
 ├── backend/               # Node.js backend API (Express)
 │   └── server.js          
 ├── frontend/              # React frontend
 │   └── src/
├── robotFramework_tests/
├── output/                    # Tests repport 
│   ├── api_report.html
│   ├── ui_employee_report.html
│   └── ui_login_report.html
├── ressources/  
│   ├── keywords/            # Definition of the test cases
│   │   ├── api_keywords/
│   │   └── ui_keywords/
│   └── variables/         # Shared Robot Framework variables and locators
│       ├── api_variables/
│       └── ui_variables/
├── tests/               # Tests suites
│   ├── api_tests/
│   └── ui_tests/

├── variables/            # Shared Robot Framework variables
├── .github/workflows/    # GitHub Actions CI config
└── README.md             # Project instructions
```

---

## ⚙️ How to Run the App

### Backend (Node.js)
```bash
cd backend
npm install
node server.js
```
Runs on `http://localhost:5000`

### Frontend (React)
```bash
cd frontend
npm install
npm start
```
Runs on `http://localhost:3000`

---

## 🤖 How to Run Tests (Robot Framework)

### Install dependencies:
```bash
pip install robotframework robotframework-seleniumlibrary robotframework-requests
```

### Run API Tests:
```bash
robot tests/api_tests.robot
```

### Run UI Tests:
```bash
robot tests/ui_tests.robot
```

---

## 📋 Test Strategy Summary

### ✅ What is being tested:
- Here are the detailed test cases for both UI and API testing:

-UI Tests
TC01: Login with Invalid Username
Steps: Navigate to the login page, enter an incorrect username and password, submit the form.
Expected Result: Error message is displayed for invalid username.

-TC02: Login with Invalid Password
Steps: Navigate to the login page, enter a valid username and incorrect password, submit the form.
Expected Result: Error message is displayed for invalid password.

-TC03: Login with Missing Username
Steps: Navigate to the login page, leave the username field empty, enter the password, and submit the form.
Expected Result: Error message is displayed for missing username.

-TC04: Login with Missing Password
Steps: Navigate to the login page, enter the username, leave the password field empty, and submit the form.
Expected Result: Error message is displayed for missing password.

-TC05: Successful Login
Steps: Navigate to the login page, enter valid credentials, submit the form.
Expected Result: The user is redirected to the home page.

-TC06: Create New Employee
Steps: Log in, click the "Add Employee" button, enter valid employee data (name, email, salary), and submit.
Expected Result: The new employee should appear on the home page list.

-TC07: Create Employee with Invalid Email
Steps: Log in, click the "Add Employee" button, enter invalid email, and submit.
Expected Result: Error message displayed for invalid email.

-TC08: Create Employee with Missing Fields
Steps: Log in, click the "Add Employee" button, leave some required fields empty, and submit.
Expected Result: Error message displayed for missing fields.

-TC09: Create Employee with Negative Salary
Steps: Log in, click the "Add Employee" button, enter a negative salary, and submit.
Expected Result: Error message displayed for invalid salary.

-TC10: Modify Existing Employee Information
Steps: Log in, click the "Edit" button for an employee, modify the employee details (name, email, salary), and submit.
Expected Result: The modified employee should be listed on the home page.

-TC11: Delete Employee
Steps: Log in, click the "Delete" button for an employee.
Expected Result: The employee should no longer be listed on the home page.

-API Tests
-TC01: Create New Employee
Steps: Send a POST request to create a new employee with valid data.
Expected Result: The employee is created successfully and a valid response is returned.

-TC02: Create Employee with Missing First Name
Steps: Send a POST request with missing first name.
Expected Result: The API returns an error message for missing fields.

-TC03: Get Created Employee
Steps: Send a GET request to retrieve the created employee.
Expected Result: The employee data is returned correctly.

-TC04: Update Employee (Valid)
Steps: Send a PUT request to update an employee's details.
Expected Result: The employee data is updated successfully.

-TC05: Delete Employee
Steps: Send a DELETE request to remove an employee.
Expected Result: The employee is deleted successfully.

-TC06: Get Deleted Employee
Steps: Send a GET request to verify that the deleted employee no longer exists.
Expected Result: The employee is not found.

### 🔍 Test Coverage:
- Positive and negative scenarios for login, Create , Edit and Delete employee with assertions 
- UI form validation
- Backend API responses positive and negative test cases


### 🧪 Tools Used:
- Robot Framework
- SeleniumLibrary (for UI)
- RequestsLibrary (for API)
- GitHub Actions (CI)

### 🔧 How to run the tests:
- Run UI tests with `robot tests/ui_tests.robot`
- Run API tests with `robot tests/api_tests.robot`

### 📌 Assumptions:
- Backend server runs on port 5000
- Frontend on port 3000
- Data is stored in-memory or local DB (no persistent storage needed)

---

## ⚙️ GitHub Actions CI (Bonus)
Tests are automatically run on every push using GitHub Actions. The workflow is in:
```
.github/workflows/test.yml
```

---

## ✅ Getting Started in 1 Minute
```bash
git clone https://github.com/KhoumriKawtar/AutomationChallenge_REMWASTE.git
cd AutomationChallenge_REMWASTE
# Start backend and frontend (in separate terminals)
cd backend && npm install && node server.js
cd ../frontend && npm install && npm start
# Run tests
robot tests/api_tests.robot
```
