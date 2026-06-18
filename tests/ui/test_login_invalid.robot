*** Settings ***
Resource  ../../resources/pages/Login_Page.robot
Resource  ../../resources/keywords/common_keywords.robot

Suite Setup  Load Environment
Test Setup  Open Application
Test Teardown  Close Application

*** Test Cases ***
TC-LN-UI-02 Login Failure with Invalid Password
    [Documentation]  Verify that login fails and an appropriate error message is shown when a valid username is entered with an incorrect password.
    Log in to parabank  ${USER_NAME}  1234
    Page Should Contain    Error!