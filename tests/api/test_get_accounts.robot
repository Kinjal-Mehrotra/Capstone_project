*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Load environment-API
Test Setup  Create a Session

*** Test Cases ***
TC-API-02 Retrieve Accounts List via API
    ${response}=  Get customer accounts  ${CUSTOMER_ID}
    ${body}=  Store response in body    ${response}
    Validate Status Code    ${response}    200
    Log To Console  Status Code: ${response.status_code}
    Log To Console    ${body}
    ${total_accounts}=  Get Length    ${body}
    Log To Console    Number of accounts: ${total_accounts}

TC-API-03 Retrieve Accounts with Non-Existent Customer ID
    ${response}=  Get customer accounts    99999999
    Validate Status Code    ${response}    400
    Log To Console    Accounts don't exist

#TC-API-01 Login via api
#    ${response}=  Get method  /login/${USERNAME}/${PASSWORD}
#    ${body}=  Store response in body    ${response}
#    Validate Status Code    ${response}    200
#    Log To Console  Status Code: ${response.status_code}
#    Log To Console    ${body}
#    ${customer_id}=  Get From Dictionary    ${body}    id
#    Set Suite Variable    ${CUSTOMER_ID}  ${customer_id}
#    Log To Console    Customer ID: ${customer_id}





