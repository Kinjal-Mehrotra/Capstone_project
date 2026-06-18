*** Settings ***
Resource  ../../resources/pages/Transfer_Funds_Page.robot
Resource  ../../resources/keywords/common_keywords.robot
Resource  ../../resources/pages/Login_Page.robot
Resource  ../../resources/pages/Open_New_Account.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-UI-TF-01 Transfer Funds Successfully via UI
    [Documentation]  Verify that a logged-in user can successfully create a new savings account using an existing account as source.
    Log in to parabank    ${USER_NAME}    ${USER_PASS}
    ${Account1}=  Create a new account    CHECKING    ${ACCOUNT_NUMBER}

    ${Account2}=  Create a new account    SAVINGS    ${ACCOUNT_NUMBER}
    Click on new transfer funds link

    Input and Select accounts  0  ${Account1}  ${Account2}

#    Input the amount to be transferred    0
#    Select the account to transfer funds from    13344
#    Select the account to transfer funds to    13677

    Transfer funds
    Validate transfer complete

