*** Settings ***
Library    SeleniumLibrary
Library     JSONLibrary
Library  RequestsLibrary
Variables    ../Locators/Locators.py
Variables    ../TestData/TestData.py
Resource    ../KeywordDefinitionFiles/Homepage.robot
Resource    ../KeywordDefinitionFiles/ProfilePage.robot
Resource    ../KeywordDefinitionFiles/ProfileSettingsPage.robot

*** Keywords ***
Verify Header Text is Visible
    element should be visible    ${HomepageHeaderText}  timeout=5

Click Logged In User Icon
    click element    ${LoggedInUserIcon}

Log Out
    click logged in user icon
    click edit profile settings
    click log out button on profile settings page
    element should not be visible    ${LoggedInUserIcon}

Open Log In Page
    open browser    https://angular.realworld.io/    Chrome
    verify header text is visible
    navigate to log in page

Log Out If Logged In
    open browser    https://angular.realworld.io/    Chrome
    ${result}=      run keyword and return status    element should be visible    ${LoggedInUserIcon}
    run keyword if      ${result}    Log Out

Open Sign Up Page
    open browser    https://angular.realworld.io/    Chrome
    log out if logged in
    click sign up from homepage