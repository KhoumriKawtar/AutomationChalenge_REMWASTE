*** Variables ***
#-------------------Variables---------------------------
${URL}      http://localhost:3000/
${WRONG_USERNAME}  wrong@example.com
${PASSWORD}        password
${USER_NAME}       user@example.com
${WRONG_PASSWORD}  wrongPassword
${LOGIN_ERROR_MESSAGE}          Invalid email
${EMAIL_ERROR_MESSAGE}          Email is required
${EMAIL0_FORMAT_ERROR_MESSAGE}  Invalid email format
${PWD_ERROR_MESSAGE}          Invalid password

#-------------------Locators---------------------------
${USER_NAME_LOCATOR}            name=email
${PASSWORD_LOCATOR}             name=password
${LOGIN_BUTTON_LOCATOR}         xpath=//button[text()="Login"]
${LOGIN_ERROR_MESSAGE_LOCATOR}  id=login-credentials-error-message
${HOME_PAGE_LOCATOR}  //h2[normalize-space()='Employee Management Software']