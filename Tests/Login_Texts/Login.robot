*** Settings ***
Documentation  To validate login form
Library         SeleniumLibrary
Test Setup      Open the browser with the Mortgage payment url
Test Teardown   Close Browser Session
Resource        Resource_0.robot

*** Variables ***


*** Test Cases ***
#Validate UnSuccesful Login
#    Fill the login form     ${user_name}     ${invalid_password}
#    Wait Until Element Is Located in the page   ${Error_message_login}
#    Verify error message is correct

Validate Cards display in the Shopping page
    Fill the login form                         ${user_name}     ${valid_password}
    Wait Until Element Is Located in the page   ${Login_Verify}

*** Keywords ***

Fill the login form
    [arguments]     ${username}     ${password}
    Input Text      id:username    ${username}
    Input Password  id:password    ${password}
    Click Button    id:signInBtn

Wait Until Element Is Located in the page
    [arguments]     ${element}
    Wait Until Element Is Visible   ${element}

#Verify error message is correct
#   ${alert_text} =     Get Text    ${Error_message_login}
#   Should Be Equal As Strings   ${alert_text}   Incorrect username/password.
#   Element Text Should Be  $${Error_message_login}    Incorrect username/password.


