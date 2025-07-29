*** Settings ***
Documentation    CRUD ui emplyee tests
Metadata         Author     Kawtar KHOUMRI
Resource  ../../ressources/keywords/ui_keywords/login_keywords.robot
Resource  ../../ressources/keywords/ui_keywords/employees_keywords.robot
Library  SeleniumLibrary
*** Test Cases ***
TC01:Create new employee
    User is in the login page   ${URL}
    The user enter the user name     ${USER_NAME}
    The User enter the password      ${PASSWORD}
    The user submmit the login form
    The user click on Add Employee button
    The user enter the first name  ${FIRSTNAME}
    The user enter the last name  ${LASTNAME}
    The user enter the email      ${EMAIL}
    The user enter the salary     ${SALARY}
    The user click on submit button
    The new employee should be listed on the home page list  ${EMAIL}
TC02:Create employee with invalid email
    User is in the login page   ${URL}
    The user enter the user name     ${USER_NAME}
    The User enter the password      ${PASSWORD}
    The user submmit the login form
    The user click on Add Employee button
    The user enter the first name  ${FIRSTNAME}
    The user enter the last name   ${LASTNAME}
    The user enter the email       ${INVALID_EMAIL}
    The user enter the salary      ${SALARY}
    The user click on submit button
    The error message of invalid email should displayed

TC03:Create employee with missing fields
    User is in the login page   ${URL}
    The user enter the user name     ${USER_NAME}
    The User enter the password      ${PASSWORD}
    The user submmit the login form
    The user click on Add Employee button
    The user click on submit button
    The error messages of missing fields should displayed

TC04:Create employee with negative salary
    User is in the login page   ${URL}
    The user enter the user name     ${USER_NAME}
    The User enter the password      ${PASSWORD}
    The user submmit the login form
    The user click on Add Employee button
    The user enter the first name  ${FIRSTNAME}
    The user enter the last name  ${LASTNAME}
    The user enter the email      ${EMAIL}
    The user enter the salary     ${INVALID_SALARY}
    The user click on submit button
    The error message of invalid salary should displayed

TC05:Create employee with existing email
    User is in the login page   ${URL}
    The user enter the user name     ${USER_NAME}
    The User enter the password      ${PASSWORD}
    The user submmit the login form
    The user click on Add Employee button
    The user enter the first name  ${FIRSTNAME}
    The user enter the last name  ${LASTNAME}
    The user enter the email      ${EXSISTING_EMAIL}
    The user enter the salary     ${SALARY}
    The user click on submit button
    The error message of existing email should displayed

TC06:Modify existing employee informations
    User is in the login page   ${URL}
    The user enter the user name     ${USER_NAME}
    The User enter the password      ${PASSWORD}
    The user submmit the login form
    The user click on Edit button   ${EMAIL}
    The user enter the first name  ${FIRSTNAME}
    The user enter the last name  ${LASTNAME}
    The user enter the email      ${NEW_EMAIL}
    The user enter the salary     ${SALARY}
    The user click on submit button
    The new employee should be listed on the home page list  ${NEW_EMAIL}
    The user click on delete employee
    Verify if the employee is no longer listed  ${EMAIL}