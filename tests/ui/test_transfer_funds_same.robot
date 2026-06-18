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

    Input and Select accounts  100  ${ACCOUNT_NUMBER}  ${ACCOUNT_NUMBER}

    Transfer funds
    Validate transfer complete