*** Settings ***
Resource  ../../variables/ui_variables/login_variables.robot
Library           SeleniumLibrary



*** Keywords ***
User is in the login page
   [Arguments]  ${URL}
    ${options}=    Evaluate    selenium.webdriver.chrome.options.Options()    modules=selenium
    #Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-gpu
    Create WebDriver    Chrome    options=${options}
    Go To    ${URL}
The user enter the user name
   [Arguments]  ${WRONG_USERNAME}
      Wait Until Element Is Visible  ${USER_NAME_LOCATOR}  10s
      Input Text  ${USER_NAME_LOCATOR}   ${WRONG_USERNAME}
The User enter the password
    [Arguments]  ${PASSWORD}
       Input Text  ${PASSWORD_LOCATOR}   ${PASSWORD}
The user submmit the login form
     Click Element   ${LOGIN_BUTTON_LOCATOR}
The login error message should be displayed
    Element Text Should Be  ${LOGIN_ERROR_MESSAGE_LOCATOR}  ${LOGIN_ERROR_MESSAGE}

The missing error message should be displayed
    ${alert_text}=    Execute JavaScript    return window.alert?.toString() !== 'undefined' ? 'open' : null;
Run Keyword If    '${alert_text}' == 'open'    ${message}=    Get Alert Message
    Should Contain    ${alert_text}    Please fill out this field.
    Handle Alert    ACCEPT

The password error message should be displayed
    Element Text Should Be  ${LOGIN_ERROR_MESSAGE_LOCATOR}  ${PWD_ERROR_MESSAGE}

The user is in the home page
    Wait Until Element Is Visible  ${HOME_PAGE_LOCATOR}  20s
    Page should contain Element   ${HOME_PAGE_LOCATOR}
