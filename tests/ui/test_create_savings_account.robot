*** Settings ***
Resource  ../../resources/pages/Open_New_Account.robot
Resource  ../../resources/keywords/common_keywords.robot
Resource  ../../resources/pages/Login_Page.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-AC-UI-01 Create New Savings Account via UI
    [Documentation]  Verify that a logged-in user can successfully create a new savings account using an existing account as source.
    Log in to parabank    ${USER_NAME}    ${USER_PASS}

    ${new_account_number}=  Create a new account    SAVINGS    ${ACCOUNT_NUMBER}

    Log To Console    New Account created with account number : ${new_account_number}
