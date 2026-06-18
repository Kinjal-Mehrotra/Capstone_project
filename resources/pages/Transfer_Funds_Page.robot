*** Settings ***
Library  SeleniumLibrary
Resource  ../../variables/home_page_locators.robot
Resource  ../../variables/transfer_funds_page_locators.robot

*** Keywords ***
Click on new transfer funds link
    [Documentation]  This will click and open the page to create new account
    Click Element    ${transfer_funds_link}

Input the amount to be transferred
    [Arguments]  ${amount}
    Set Test Variable    ${AMOUNT}  ${amount}
    Input Text    ${amount_field}    ${amount}

Select the account to transfer funds from
    [Arguments]  ${from_account_number}
    Set Test Variable    ${FROM_ACCOUNT_NUMBER}  ${from_account_number}
    Wait Until Element Is Enabled    ${from_account_dropdown}
    ${from_available_accounts}=  Get List Items    ${from_account_dropdown}
    Log To Console    accounts:${from_available_accounts}
    Wait Until Keyword Succeeds    10s    1s    Select From List By Value    ${from_account_dropdown}  ${from_account_number}

Select the account to transfer funds to
    [Arguments]  ${to_account_number}
    Set Test Variable    ${TO_ACCOUNT_NUMBER}  ${to_account_number}
    Wait Until Element Is Enabled    ${to_account_dropdown}
    ${to_available_accounts}=  Get List Items    ${to_account_dropdown}
    Log To Console    accounts:${to_available_accounts}
    Wait Until Keyword Succeeds    10s    1s    Select From List By Value    ${to_account_dropdown}  ${to_account_number}

Transfer funds
    Click Element    ${transfer_button}

Validate transfer complete
    Page Should Contain    Transfer Complete!

Validate incomplete transfer
    Page Should Contain    Error!

Validate transfer details
    Wait Until Page Contains Element    ${amount_transfered_confirm}
    Wait Until Page Contains  ${AMOUNT}
    Log To Console    ${AMOUNT}

    Page Should Contain    ${AMOUNT}
    Page Should Contain    ${FROM_ACCOUNT_NUMBER}
    Page Should Contain    ${TO_ACCOUNT_NUMBER}

Input and Select accounts
    [Arguments]  ${amount}  ${from_account}  ${to_account}
    Input the amount to be transferred  ${amount}
    Select the account to transfer funds from  ${from_account}
    Select the account to transfer funds to    ${to_account}

