*** Settings ***
Documentation   A resource file with reusable keywords and variables
...
...             The system specific keywords created here from our own
...             domain specific language. They utilize keywords provided
...             by the imported libraries. (In this case SeleniumLibrary).

Library         SeleniumLibrary

*** Variables ***
${document_number}         273.173.190-74
${invalid_password}        r12345678
${url}                     https://www.fastshop.com.br/

*** Keywords ***

Open the browser with the Fast Shop url
    Create Webdriver    Chrome
    Open Browser        ${url}

Close Browser Session
    Close Browser