*** Settings ***
Resource  ../../variables/ui_variables/employees_variables.robot
Library           SeleniumLibrary



*** Keywords ***

The user click on Add Employee button
     Wait Until Element Is Visible  ${ADD_EMPLOYEE_LOCATOR}  10s
     Wait Until Element Is Enabled  ${ADD_EMPLOYEE_LOCATOR}  5s
     Click Element   ${ADD_EMPLOYEE_LOCATOR}
The user enter the first name
    [Arguments]  ${FIRSTNAME}
      Wait Until Element Is Visible  ${FIRSTNAME_LOCATOR}  10s
      Input Text  ${FIRSTNAME_LOCATOR}  ${FIRSTNAME}
The user enter the last name
    [Arguments]  ${LASTNAME}
      Input Text  ${LASTNAME_LOCATOR}    ${LASTNAME}
The user enter the email
    [Arguments]  ${EMAIL}
      Input Text  ${EMAIL_LOCATOR}     ${EMAIL}
The user enter the salary
    [Arguments]  ${SALARY}
      Input Text  ${SALARY_LOCATOR}  ${SALARY}
The user click on submit button
    Click Element   ${SUBMIT_LOCATOR}
The new employee should be listed on the home page list
    [Arguments]   ${EMAIL}
    Wait Until Element Is Visible  ${EMPLOYEE_LIST_LOCATOR}   10s
    Page Should Contain    ${EMAIL}

The error message of invalid email should displayed
    Element Text Should Be  ${INVALID_EMAIL_ERROR_MESSAGE_LOCATOR}  ${INVALID_EMAIL_ERROR}

The error messages of missing fields should displayed
    Element Text Should Be  ${FIRSTNAME_ERROR_MESSAGE_LOCATOR}  ${MISSING_FIRSTNAME_ERROR}
    Element Text Should Be  ${LASTNAME_ERROR_MESSAGE_LOCATOR}  ${MISSING_LASTNAME_ERROR}
    Element Text Should Be  ${EMAIL_ERROR_MESSAGE_LOCATOR}  ${MISSING_EMAIL_ERROR}
    Element Text Should Be  ${SALARY_ERROR_MESSAGE_LOCATOR}  ${MISSING_SALARY_ERROR}

The error message of invalid salary should displayed
    Element Text Should Be  ${INVALID_SALARY_ERROR_MESSAGE_LOCATOR}   ${INVALID_SALARY_ERROR}

The error message of existing email should displayed
    Wait Until Element Is Visible  ${EXSISTING_EMAIL_ERROR_MESSAGE_LOCATOR}   10s
    Element Text Should Be  ${EXSISTING_EMAIL_ERROR_MESSAGE_LOCATOR}    ${EXSISTING_EMAIL_ERROR}

The user click on delete employee
    Click Element   ${DELETE_LOCATOR}

The user click on Edit button
      [Arguments]  ${EMAIL}
        Wait Until Element Is Visible  ${Edit_LOCATOR}
        Click Element   ${Edit_LOCATOR}

Verify if the employee is no longer listed
    [Arguments]    ${EMAIL}
        Element Should Not Be Visible   ${DELETE_EMPLOYEE_LOCATOR}