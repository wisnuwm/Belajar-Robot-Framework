*** Settings ***
Library              SeleniumLibrary
Suite Setup          Open Browser    ${WebURL}        ${BROWSERS}
Suite Teardown       Close Browser
Test Template        I want to login with invalid credentials
Library              DataDriver        credentials.csv        sheet_name=Sheet1
Library              DataDriver        valid_credentials.csv        sheet_name=Sheet1
*** Variables ***
${BROWSERS}          Chrome
${WebURL}            https://www.saucedemo.com/

*** Keywords ***
I want to login with invalid credentials
    [Arguments]            ${username}            ${password}
    Input Text             id=user-name           ${username}
    Input Text             id=password            ${password}
    Click Element          id=login-button
    # Capture Page Screenshot
    # Page Should Contain    Epic sadface: Username and password do not match any user in this service
Should failed and showing error
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
Should successfully redirected to dashboard
    Page Should Contain    Sauce Labs Backpack

*** Test Cases ***
# Login with invalid credentials userA                ${txtUsername}     ${txtPassword}
# Login with invalid credentials userB                ${txtUsername}     ${txtPassword}  
# Login with invalid credentials userC                ${txtUsername}     ${txtPassword} 
# Login with invalid credentials standar_user         standard_user     secret_sauce 
Login with invalid credentials should failed with CSV         ${username}     ${password}
# Login with valid credentials should success with CSV        ${Vusername}     ${Vpassword}
