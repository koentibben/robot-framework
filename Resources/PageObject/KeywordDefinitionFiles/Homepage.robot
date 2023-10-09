*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/TestData.py

*** Keywords ***
Navigate To Log In Page
    click element    ${LogInButton}
    wait until location contains    /login

Click Sign Up From Homepage
    click element    ${SignUpButton}