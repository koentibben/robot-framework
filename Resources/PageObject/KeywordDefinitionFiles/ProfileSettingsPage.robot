*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/TestData.py

*** Keywords ***
Click Log Out Button On Profile Settings Page
    click element       ${ProfileSettingsLogOutButton}