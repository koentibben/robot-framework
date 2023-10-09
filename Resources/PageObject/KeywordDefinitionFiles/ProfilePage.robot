*** Settings ***
Library  SeleniumLibrary
Variables  ../Locators/Locators.py
Variables  ../TestData/TestData.py

*** Keywords ***
Click Edit Profile Settings
    click element       ${EditProfileSettingsButton}