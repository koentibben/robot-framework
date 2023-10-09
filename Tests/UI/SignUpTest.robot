*** Settings ***
Documentation  Sign Up Using POM / Robot Framework
Library  SeleniumLibrary
Library     FakerLibrary
Resource    ../../Resources/PageObject/KeywordDefinitionFiles/LogInPage.robot

*** Settings ***
Test Setup      Open Sign Up Page

*** Test Cases ***
Sign In Option Should Be Shown
     element should be visible    ${SignUpPageHaveAnAccountSignInButton}

Required Sign Up Input Fields
    input text  ${SignUpPageUsernameInputBox}   blaat1337
    input text  ${SignUpPageEmailInputBox}      blaat@1337.com
    ${disabled_button_state_without_password}=      get element attribute    ${SignUpPageSignUpButton}    disabled
    should be equal as strings    ${disabled_button_state_without_password}  true
    clear element text    ${SignUpPageUsernameInputBox}
    input text  ${SignUpPagePasswordInputBox}      MYP455W0RD!12345
    click sign up
    wait until element is visible       ${ErrorMessage}
    element text should be    ${ErrorMessage}      username can't be blank
    input text  ${SignUpPageUsernameInputBox}   blaat1337
    clear element text      ${SignUpPageEmailInputBox}
    ${disabled_button_state_without_email}=      get element attribute    ${SignUpPageSignUpButton}    disabled
    should be equal as strings    ${disabled_button_state_without_email}  true

Successful Sign Up Flow
    ${email} =  FakerLibrary.email
    ${username} =  FakerLibrary.username
    ${password} =  FakerLibrary.password
    input text  ${SignUpPageUsernameInputBox}       ${username}
    input text  ${SignUpPageEmailInputBox}       ${email}
    input text  ${SignUpPagePasswordInputBox}      ${password}
    click sign up
    wait until element is visible    ${NewArticleButton}
    element should not be visible    ${SignUpButton}