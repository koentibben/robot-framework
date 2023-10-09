*** Settings ***
Documentation  Testing the Users API
Library     JSONLibrary
Library  RequestsLibrary

*** Variables ***
${base_url}     https://api.realworld.io

*** Test Cases ***
Login API call without password
        create session    mysession     ${base_url}
        ${json}=        load json from file    ${CURDIR}/../../Resources/Requests/post_users_without_password.json
        ${response}=       post on session    mysession     ${base_url}/api/users/login     json=${json}        expected_status=422
        ${expected_error}=      get value from json    ${response.json()}       $.errors
        should be equal as strings    ${expected_error}     [{'password': ["can't be blank"]}]

Login API call without email
        create session    mysession     ${base_url}
        ${json}=        load json from file    ${CURDIR}/../../Resources/Requests/post_users_without_email.json
        ${response}=       post on session    mysession     ${base_url}/api/users/login     json=${json}        expected_status=422
        ${expected_error}=      get value from json    ${response.json()}       $.errors
        should be equal as strings    ${expected_error}     [{'email': ["can't be blank"]}]

Login API call with invalid user credentials
        create session    mysession     ${base_url}
        ${json}=        load json from file    ${CURDIR}/../../Resources/Requests/post_users_email_password_invalid.json
        ${response}=       post on session    mysession     ${base_url}/api/users/login     json=${json}        expected_status=403
        ${expected_error}=      get value from json    ${response.json()}       $.errors
        should be equal as strings    ${expected_error}     [{'email or password': ['is invalid']}]