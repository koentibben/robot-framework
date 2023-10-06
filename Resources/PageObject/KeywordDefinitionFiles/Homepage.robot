*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/TestData.py

*** Keywords ***
Navigate To Log In Page
    click element    ${homepageloginbutton}
    wait until location contains    /login