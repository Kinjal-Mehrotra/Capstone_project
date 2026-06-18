*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Load environment-API
Test Setup  Create a Session

*** Test Cases ***
TC-API-02 Creation of Savings Account
    ${response}=  Create account    ${CUSTOMER_ID}    1    ${BASE_ACCOUNT_NUMBER}
    Validate Status Code    ${response}    200
    ${body}=  Store response in body    ${response}

    ${new_account_created}=  Get From Dictionary    ${body}    id
    Log To Console    ${new_account_created}

TC-API-02 Creation of Checking Account
    ${response}=  Create account    ${CUSTOMER_ID}    0    ${BASE_ACCOUNT_NUMBER}
    Validate Status Code    ${response}    200
    ${body}=  Store response in body    ${response}

    ${new_account_created}=  Get From Dictionary    ${body}    id
    Log To Console    ${new_account_created}

TC-API-02 Creation of Loan Account
    ${response}=  Create account    ${CUSTOMER_ID}    2    ${BASE_ACCOUNT_NUMBER}
    Validate Status Code    ${response}    200
    ${body}=  Store response in body    ${response}

    ${new_account_created}=  Get From Dictionary    ${body}    id
    Log To Console    ${new_account_created}