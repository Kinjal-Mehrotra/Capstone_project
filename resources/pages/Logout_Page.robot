*** Settings ***
Library  SeleniumLibrary
Resource  ../../variables/home_page_locators.robot
Resource  ../../variables/login_page_locators.robot
Resource  ../keywords/common_keywords.robot

*** Keywords ***
Log out of the application
    [Documentation]  Verify that clicking Log Out ends the session and subsequent direct navigation to a protected URL redirects to the Login page.
    Click Element    ${log_out_link}
    Page Should Contain Element  ${login_button}
    Location Should Contain    index.htm
