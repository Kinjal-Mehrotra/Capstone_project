*** Settings ***
Resource  ../../resources/pages/Login_Page.robot
Resource  ../../resources/keywords/common_keywords.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-LN-UI-03 Login with Both Fields Empty
    [Documentation]  Verify that submitting the login form with both username and password blank triggers mandatory field validation messages.
    Log in to parabank    ${EMPTY}    ${EMPTY}
    Page Should Contain    Error!