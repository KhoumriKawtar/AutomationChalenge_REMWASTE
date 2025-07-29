*** Variables ***
#-------------------Variables---------------------------
${FIRSTNAME}  Sara
${LASTNAME}   Jonny
${EMAIL}      Sara.jonny@gmail.com
${EXSISTING_EMAIL}  test@test.com
${SALARY}    5000
${INVALID_EMAIL}   sara.com
${INVALID_SALARY}   -9
${NEW_EMAIL}      edited@test.com
${MISSING_FIRSTNAME_ERROR}  First name is required
${MISSING_LASTNAME_ERROR}  Last name is required
${MISSING_EMAIL_ERROR}   Email is required
${MISSING_SALARY_ERROR}  Salary is required
${INVALID_EMAIL_ERROR}   Invalid email format
${INVALID_SALARY_ERROR}  Enter a valid salary
${EXSISTING_EMAIL_ERROR}  Email already exists
#-------------------Locators---------------------------


${ADD_EMPLOYEE_LOCATOR}  //button[@class='btn btn-primary me-2']
${NEW_EMPLOYEE_LOCATOR}  //td[normalize-space()='John']
${FIRSTNAME_LOCATOR}  //input[@placeholder='FirstName']
${LASTNAME_LOCATOR}   //input[@placeholder='LastName']
${EMAIL_LOCATOR}      //input[@placeholder='Email']
${SALARY_LOCATOR}    //input[@placeholder='Salary']
${SUBMIT_LOCATOR}   //i[@class='fas fa-check']
${FIRSTNAME_ERROR_MESSAGE_LOCATOR}  //div[contains(text(),'First name is required')]
${LASTNAME_ERROR_MESSAGE_LOCATOR}   //div[contains(text(),'Last name is required')]
${EMAIL_ERROR_MESSAGE_LOCATOR}     //div[contains(text(),'Email is required')]
${SALARY_ERROR_MESSAGE_LOCATOR}    //div[contains(text(),'Salary is required')]
${INVALID_EMAIL_ERROR_MESSAGE_LOCATOR}  //div[contains(text(),'Invalid email format')]
${INVALID_SALARY_ERROR_MESSAGE_LOCATOR}  //div[contains(text(),'Enter a valid salary')]
${EXSISTING_EMAIL_ERROR_MESSAGE_LOCATOR}  (//div[@class='invalid-feedback'])[1]
${DELETE_LOCATOR}                        xpath=//tr[td[contains(text(), '${NEW_EMAIL}')]]//button[contains(text(), 'Delete')]
${Edit_LOCATOR}  xpath=//tr[td[contains(text(), '${EMAIL}')]]//button[contains(text(), 'Edit')]
${DELETE_EMPLOYEE_LOCATOR}  xpath=//tr[td[contains(text(), '${EMAIL}')]]
${EMPLOYEE_LIST_LOCATOR}  //tbody