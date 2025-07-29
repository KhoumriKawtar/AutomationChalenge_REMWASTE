*** Settings ***
Library   RequestsLibrary
Library           Collections
Library           OperatingSystem
Library           JSONLibrary

Resource  ../../variables/api_variables/employee_api_variables.robot


*** Keywords ***

Create New employee
    ${employee}=    Create Dictionary
    ...    firstName=${FIRST_NAME}
    ...    lastName=${LAST_NAME}
    ...    email=${EMAIL}
    ...    salary=${SALARY}

    Create Session    api    ${BASE_URL}
    ${response}=      Post On Session    api    /employees    json=${employee}
    Should Be Equal As Integers    ${response.status_code}    201
    ${data}=          To JSON    ${response.content}
    Set Suite Variable    ${EMPLOYEE_ID}    ${data['id']}

Create New Employee - Missing First Name
    ${employee}=    Create Dictionary
    ...    lastName=${LAST_NAME}
    ...    email=${EMAIL}
    ...    salary=${SALARY}
    ${response}=    Post On Session    api    /employees    json=${employee}   expected_status=ANY
    Should Be Equal As Integers    ${response.status_code}    400


Get Created Employee
    ${response}=    Get On Session    api    /employees/${EMPLOYEE_ID}
    Should Be Equal As Integers    ${response.status_code}    200

Update employee
    ${updated}=    Create Dictionary
    ...    firstName=${UPDATED_FIRST}
    ...    lastName=${UPDATED_LAST}
    ...    email=${UPDATED_EMAIL}
    ...    salary=${UPDATED_SALARY}

    ${response}=    Put On Session   api    /employees/${EMPLOYEE_ID}    json=${updated}
    Should Be Equal As Integers    ${response.status_code}    200

Update Employee - Invalid email
     ${employee}=    Create Dictionary
    ...    firstName=${FIRST_NAME}
    ...    lastName=${LAST_NAME}
    ...    email=invalid-email
    ...    salary=${SALARY}
    ${response}=    Post On Session    api    /employees    json=${employee}
    Should Be Equal As Integers    ${response.status_code}    400
Delete employee
     ${response}=    Delete On Session    api    /employees/${EMPLOYEE_ID}
    Should Be Equal As Integers    ${response.status_code}    200
Get Deleted Employee
   ${response}=    Get On Session    api    /employees/${EMPLOYEE_ID}  expected_status=ANY
    Should Be Equal As Integers    ${response.status_code}    404

