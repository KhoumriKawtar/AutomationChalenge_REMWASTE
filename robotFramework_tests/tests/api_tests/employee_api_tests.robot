*** Settings ***
Documentation    Employee api CRUD test
Metadata         Author     Kawtar KHOUMRI

Resource  ../../ressources/keywords/api_keywords/employee_keywords.robot
*** Test Cases ***
TC01: Create New employee
    Create New employee
TC02: Create New Employee - Missing First Name
    Create New Employee - Missing First Name
TC03: Get Created Employee
    Get Created Employee
TC04: Update Employee - Valid
    Update Employee
TC05: Delete Employee
    Delete Employee
TC06: Get Deleted Employee
    Get Deleted Employee
