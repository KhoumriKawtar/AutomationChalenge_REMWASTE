*** Settings ***
Documentation    log in test suite
Metadata         Author     Kawtar KHOUMRI


Resource  ../../ressources/keywords/ui_keywords/login_keywords.robot
Library  SeleniumLibrary

*** Test Cases ***
TC01:Login with invalid username
    User is in the login page   ${URL}
    The user enter the user name     ${WRONG_USERNAME}
    The User enter the password      ${PASSWORD}
    The user submmit the login form
    The login error message should be displayed

TC02:Login with invalid password
    User is in the login page   ${URL}
    The user enter the user name     ${USER_NAME}
    The User enter the password      ${WRONG_PASSWORD}
    The user submmit the login form
    The password error message should be displayed

TC03:Login with missing username
    User is in the login page   ${URL}
    The User enter the password      ${WRONG_PASSWORD}
    The user submmit the login form
    The missing error message should be displayed

TC04:Login with missing password
    User is in the login page   ${URL}
    The user enter the user name     ${USER_NAME}
    The user submmit the login form
    The missing error message should be displayed


TC04: Successful login
    User is in the login page   ${URL}
    The user enter the user name     ${USER_NAME}
    The User enter the password      ${PASSWORD}
    The user submmit the login form
    The user is in the home page