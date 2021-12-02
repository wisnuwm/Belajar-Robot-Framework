*** Settings ***
Library              SeleniumLibrary
Library              DataDriver        ../Resources/credentials.csv        sheet_name=Sheet1
Resource             ../Resources/login_pages.robot
Suite Setup          Open Browser    ${WebURL}        ${BROWSERS}
Suite Teardown       Close Browser
Test Template        As a user i want to login with invalid credentials using CSV file

# Test Template        As a user i want to login with invalid credentials using CSV files

# *** Keywords ***
# As a user i want to login with invalid credentials using CSV files
#     [Arguments]            ${username}    ${password}
#     I want to login with invalid credentials      ${username}    ${password}  

*** Keywords ***
As a user i want to login with invalid credentials using CSV file
    I want to login with invalid credentials            ${username}    ${password}

*** Test Cases ***
I want to login with invalid credentials         ${txtUsername}     ${txtPassword}