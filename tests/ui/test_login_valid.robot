*** Settings ***
Resource  ../../resources/pages/Login_Page.robot
Resource  ../../resources/keywords/common_keywords.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-LN-UI-01 Successful Login with Valid Credentials
    [Documentation]  Verify that a registered user can log in with correct username and password and sees the welcome confirmation.
    Log in to parabank  ${USER_NAME}  ${USER_PASS}
    Wait Until Page Contains    Welcome
    Page Should Contain    Welcome ${USER_FULLNAME}