*** Settings ***
Documentation  Testing the Tags API
Library  RequestsLibrary

*** Variables ***
${base_url}     https://api.realworld.io

*** Test Cases ***
Do a GET request and assert that the first tag contains 'welcome'
    ${response}=    GET    ${base_url}/api/tags     expected_status=200
    log to console    ${response.json()}
    should be equal as strings    welcome  ${response.json()}[tags][0]