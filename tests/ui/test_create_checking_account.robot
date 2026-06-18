*** Settings ***
Resource  ../../resources/pages/Open_New_Account.robot
Resource  ../../resources/keywords/common_keywords.robot
Resource  ../../resources/pages/Login_Page.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-AC-UI-02 Create New Checking Account via UI
    [Documentation]  Verify that a logged-in user can successfully create a new savings account using an existing account as source.
    Log in to parabank    ${USER_NAME}    ${USER_PASS}
#    Click on new account link
#    Select type of account    CHECKING
#    Select the account to transfer initial funds from  ${ACCOUNT_NUMBER}
#    Open new account
#    ${new_account_number}=  Validate account creation
    ${new_account_number}=  Create a new account    CHECKING    ${ACCOUNT_NUMBER}
    Log To Console    New Account created with account number : ${new_account_number}
