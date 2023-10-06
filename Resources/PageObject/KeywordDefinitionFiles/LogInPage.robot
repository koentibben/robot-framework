*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/TestData.py

*** Keywords ***
Input Username
    Input Text  ${LogInPageUserEmailInputBox}  ${UserEmail}

Input Password
    Input Text  ${LogInPageUserPasswordInputBox}  ${UserPassword}

Click Login
    Click Element  ${LogInPageLogInButton}