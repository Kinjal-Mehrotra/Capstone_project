*** Settings ***

Resource    ../../resources/keywords/api_keywords.robot
Suite Setup  Load environment-API
Test Setup  Create a Session
Library    OperatingSystem

*** Test Cases ***
Transfer funds via API
    [Documentation]
    ${response}=  Create account    ${CUSTOMER_ID}    1    ${BASE_ACCOUNT_NUMBER}
    Validate Status Code    ${response}    200
    ${body}=  Store response in body    ${response}
    ${Account1}=  Get From Dictionary    ${body}    id
    Log To Console    ${Account1}

    ${response}=  Create account    ${CUSTOMER_ID}    1    ${BASE_ACCOUNT_NUMBER}
    Validate Status Code    ${response}    200
    ${body}=  Store response in body    ${response}
    ${Account2}=  Get From Dictionary    ${body}    id
    Log To Console    ${Account2}

    ${response}=  Transfer the funds    ${Account1}   ${Account2}    10000
    Validate Status Code    ${response}    200