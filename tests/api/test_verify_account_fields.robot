*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot

Suite Setup  Load environment-API
Test Setup  Create a Session

*** Test Cases ***
TC-API-04 Verify Account Fields and Data Types
    ${response}=  Get method  /customers/${CUSTOMER_ID}/accounts
    ${body}=  Store response in body    ${response}
    Validate Status Code    ${response}    200

    FOR  ${account}  IN  @{body}
        ${id}=  Get From Dictionary    ${account}    id
        ${customer_id}=  Get From Dictionary    ${account}    customerId
        ${type}=  Get From Dictionary    ${account}    type
        ${balance}=  Get From Dictionary    ${account}    balance


       Should Be True    ${id}>0
       Should Be True    ${customer_id}>0
       Should Contain    ['CHECKING','SAVINGS','LOAN']    ${type}
       Should Be True    isinstance(${balance},(int,float))

    END
