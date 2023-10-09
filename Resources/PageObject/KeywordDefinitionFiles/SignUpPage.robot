*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/TestData.py

*** Keywords ***
Click Sign Up
    Click Element  ${SignUpPageSignUpButton}