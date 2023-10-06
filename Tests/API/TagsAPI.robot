*** Settings ***
Documentation  Testing in the Tags API
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}     https://api.realworld.io

*** Test Cases ***
Do a GET request and assert that the first tag contains 'welcome'
    ${response}=    GET    ${base_url}/api/tags     expected_status=200
    log to console    ${response.json()}
    Should Be Equal As Strings    welcome  ${response.json()}[tags][0]