*** Settings ***
#Resource  ../../resources/keywords/api_keywords.robot
#Resource  ../../resources/api/Accounts.robot
Resource    ../../resources/keywords/api_keywords.robot


Suite Setup  Load environment-API
Test Setup  Create a Session
Library    OperatingSystem

*** Test Cases ***
TC-API-01 Login via api
    ${response}=  Get method  /login/${USERNAME}/${PASSWORD}
    ${body}=  Store response in body    ${response}
    Validate Status Code    ${response}    200
    Log To Console  Status Code: ${response.status_code}
    Log To Console    ${body}
    ${customer_id}=  Get From Dictionary    ${body}    id
    Set Suite Variable    ${CUSTOMER_ID}  ${customer_id}
    Log To Console    Customer ID: ${customer_id}







