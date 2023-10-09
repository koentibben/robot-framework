*** Settings ***
Documentation  Log In Using POM / Robot Framework
Library  SeleniumLibrary
Resource    ../../Resources/PageObject/KeywordDefinitionFiles/LogInPage.robot

*** Settings ***
Test Setup      Open Log In Page
Test Teardown       Log Out If Logged In

*** Test Cases ***
Successful Login
    input username
    input password
    click login

Failed Login
    input text  ${LogInPageUserEmailInputBox}  blaat@leet.com
    input text  ${LogInPageUserPasswordInputBox}  1337
    click login
    wait until element is visible       ${ErrorMessage}
    element text should be    ${ErrorMessage}      email or password is invalid

Required Log In Input Fields
    input username
    ${disabled_button_state_without_password}=      get element attribute    ${LogInPageLogInButton}    disabled
    should be equal as strings    ${disabled_button_state_without_password}  true
    clear element text    ${LogInPageUserEmailInputBox}
    input password
    ${disabled_button_state_without_username}=      get element attribute    ${LogInPageLogInButton}    disabled
    should be equal as strings    ${disabled_button_state_without_username}  true