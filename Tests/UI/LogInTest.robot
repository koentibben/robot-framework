*** Settings ***
Documentation  Log In Using POM / Robot Framework
Library  SeleniumLibrary
Resource    ../../Resources/PageObject/KeywordDefinitionFiles/Homepage.robot
Resource    ../../Resources/PageObject/KeywordDefinitionFiles/LogInPage.robot
Resource    ../../Resources/PageObject/KeywordDefinitionFiles/Common.robot

*** Variables ***
${site_base_url}    https://angular.realworld.io/
${browser}      Chrome

*** Test Cases ***
Successful Login
    open browser    ${site_base_url}    ${browser}
    verify header text is visible
    navigate to log in page
    input username
    input password
    click login