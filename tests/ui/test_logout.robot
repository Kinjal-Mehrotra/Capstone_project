*** Settings ***
Resource  ../../resources/pages/Logout_Page.robot
Resource  ../../resources/keywords/common_keywords.robot
Resource  ../../resources/pages/Login_Page.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-LN-UI-04 Logout Terminates Session and Restricts Protected Pages
    [Documentation]  Verify that clicking Log Out ends the session and subsequent direct navigation to a protected URL redirects to the Login page.
    Log in to parabank    ${USER_NAME}    ${USER_PASS}
    Log out of the application