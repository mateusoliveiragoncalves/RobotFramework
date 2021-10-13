*** Settings ***
Documentation   To validate login form
Library         SeleniumLibrary
Test Setup      Open the browser with the Fast Shop url
Test Teardown   Close Browser Session
Resource        resource.robot

*** Variables ***
${Document_alert}               css:.invalid-text
${Error_alert}                  css:.err-msg
${Redirect_Login}               id:redirect-login
${CPF_Input}                    id:document
${Password_Input}               id:password
${Not_Subscribed_Alert}         Você não tem cadastro na Fast Shop. Cadastre-se
${Wrong_Password_Alert}         Senha incorreta ou senha expirada
*** Test Cases ***
Validate UnSuccesful Login
    Click on the Enter Login button
    Fill the login form     ${document_number}  ${invalid_password}
    Wait until it checks and dispalys a message
    Verify error message is correct

*** Keywords ***

Click on the Enter Login button
    Click Element                   ${Redirect_Login}
    Wait Until Element Is Visible   ${CPF_Input}

Fill the login form
    [arguments]     ${CPF}               ${password}
    Input Text      ${CPF_Input}         text = ${CPF}
    Input Password  ${Password_Input}    text = ${password}
    Click Button    id:auto-btn-login

Wait until it checks and dispalys a message
    Wait Until Element Is Visible   ${Document_alert}
    Wait Until Element Is Visible   ${Error_alert}


Verify error message is correct
    Element Text Should Be  ${Document_alert}    ${Not_Subscribed_Alert}
    Element Text Should Be  ${Error_alert}       ${Wrong_Password_Alert}

#   We can compare as strings naming a local variable into the context or do like we have uphead

#   ${document_alert_text} =     Get Text    ${Document_alert}
#   ${error_alert_text} =     Get Text    ${Error_alert}
#   Should Be Equal As Strings   ${document_alert_text}   Você não tem cadastro na Fast Shop. Cadastre-se
#   Should Be Equal As Strings   ${error_alert_text}   Senha incorreta ou senha expirada



