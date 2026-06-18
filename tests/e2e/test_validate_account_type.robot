
*** Settings ***
Resource  ../../resources/pages/Open_New_Account.robot
Resource  ../../resources/keywords/common_keywords.robot
Resource  ../../resources/pages/Login_Page.robot
Resource  ../../resources/keywords/api_keywords.robot

Suite Setup  Run Keywords  Load Environment  AND  Load environment-API
Test Setup  Run Keywords  Open Application  AND  Create a Session
Test Teardown  Close Application

*** Test Cases ***
Account Type In API Matches UI Selection

    [Documentation]
    Log in to parabank    ${USER_NAME}    ${USER_PASS}
    Click on new account link
    Select type of account  CHECKING
    Select the account to transfer initial funds from  ${BASE_ACCOUNT_NUMBER}
    Open new account

    ${new_account_created}=  Validate account creation
    Log To Console    ${new_account_created}

    ${body}=  Retrieve account by its number  ${new_account_created}

    ${type}=  Get From Dictionary    ${body}    type
    Should Be Equal As Strings    CHECKING    ${type}


