*** Settings ***

Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Load environment-API
Test Setup  Create a Session
Library    OperatingSystem

*** Test Cases ***
Get account by ID
    [Documentation]
    ${body}=  Retrieve account by its number  ${BASE_ACCOUNT_NUMBER}
    Should Not Be Empty    ${body}
