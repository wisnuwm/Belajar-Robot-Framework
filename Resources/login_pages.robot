*** Settings ***
Library              SeleniumLibrary
Suite Setup          Open Browser    ${WebURL}        ${BROWSERS}
Suite Teardown       Close Browser
Test Template        I want to login with invalid credentials
# Library              DataDriver        credentials.csv        sheet_name=Sheet1
# Library              DataDriver        valid_credentials.csv        sheet_name=Sheet1
Variables                  ../Resources/login_locators.yaml


*** Variables ***
${BROWSERS}          Chrome
${WebURL}            https://www.saucedemo.com/

*** Keywords ***
I want to login with invalid credentials
    [Arguments]            ${username}            ${password}
    Input Text             ${txtUsername}         ${username}
    Input Text             ${txtPassword}         ${password}
    Click Element          ${btnLogin}
    # Capture Page Screenshot
    Page Should Contain    Epic sadface: Username and password do not match any user in this service