*** Settings ***

Resource    ../../resources/keywords/api_keywords.robot
Suite Setup  Load environment-API
Test Setup  Create a Session
Library    OperatingSystem

*** Test Cases ***
Get list fo transactions for the account
    [Documentation]
    ${response}=  Get method    /accounts/${BASE_ACCOUNT_NUMBER}/transactions
    ${body}=  Store response in body    ${response}
    Log To Console    ${body}
    Validate Status Code    ${response}    200
    ${total_transactions}=  Get Length    ${body}
    Log To Console    Total transactions of account ${BASE_ACCOUNT_NUMBER} : ${total_transactions}