*** Settings ***
Resource  ../../resources/pages/Transfer_Funds_Page.robot
Resource  ../../resources/keywords/common_keywords.robot
Resource  ../../resources/pages/Login_Page.robot
Resource  ../../resources/keywords/api_keywords.robot


Suite Setup  Run Keywords  Load Environment  AND  Load environment-API
Test Setup  Run Keywords  Open Application  AND  Create a Session
Test Teardown  Close Application

*** Test Cases ***
Validate Balances via API After UI Transfer
    [Documentation]
    ${response}=  Create account    ${CUSTOMER_ID}    1    ${BASE_ACCOUNT_NUMBER}
    Validate Status Code    ${response}    200
    ${body}=  Store response in body    ${response}
    ${Account1}=  Get From Dictionary    ${body}    id

    ${response}=  Create account    ${CUSTOMER_ID}    1    ${BASE_ACCOUNT_NUMBER}
    Validate Status Code    ${response}    200
    ${body}=  Store response in body    ${response}
    ${Account2}=  Get From Dictionary    ${body}    id

    Log in to parabank    ${USER_NAME}    ${USER_PASS}
    Click on new transfer funds link
    Input the amount to be transferred    ${amount_to_transfer}
    Select the account to transfer funds from    ${Account1}

    ${body1}=  Retrieve account by its number  ${Account1}
    ${amount_before_transfer_acc1}=  Get amount    ${body1}
    Log to console  Balance of Account 1 before transfer: ${amount_before_transfer_acc1}

    Select the account to transfer funds to    ${Account2}
    ${body2}=  Retrieve account by its number  ${Account2}
    ${amount_before_transfer_acc2}=  Get amount    ${body2}
    Log to console  Balance of Account 2 before transfer: ${amount_before_transfer_acc2}

    Transfer funds
    Validate transfer complete

    ${body3}=  Retrieve account by its number  ${Account1}
    ${amount_after_transfer_acc1}=  Get amount    ${body3}
    Log to console  Balance of Account 1 after transfer: ${amount_after_transfer_acc1}

    Select the account to transfer funds to    ${Account2}
    ${body4}=  Retrieve account by its number  ${Account2}
    ${amount_after_transfer_acc2}=  Get amount    ${body4}
    Log to console  Balance of Account 2 after transfer: ${amount_after_transfer_acc2}

    ${final_account_1}=  Evaluate  float(${amount_before_transfer_acc1})-float(${amount_to_transfer})
    ${final_account_2}=  Evaluate  float(${amount_before_transfer_acc2})+float(${amount_to_transfer})

    Should Be Equal As Integers    ${amount_after_transfer_acc1}   ${final_account_1}
    Should Be Equal As Integers    ${amount_after_transfer_acc2}  ${final_account_2}








