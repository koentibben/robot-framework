*** Settings ***
Library    SeleniumLibrary
Variables    ../Locators/Locators.py
Variables    ../TestData/TestData.py

*** Keywords ***
Verify Header Text is Visible
    element should be visible    ${HomepageHeaderText}  timeout=5