*** Settings ***

*** Variables ***
${user_name}            rahulshettyacademy
${valid_password}       learning
${invalid_password}     r12345678
${url}                  https://rahulshettyacademy.com/loginpagePractise/
${Error_message_login}  css:.alert-danger
${Login_Verify}         css:.nav-link

*** Keywords ***

Open the browser with the Mortgage payment url
    Create Webdriver    Chrome
    Open Browser        ${url}

Close Browser Session
    Close Browser