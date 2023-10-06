*** Settings ***
Documentation  Testing in the Articles API
Library     JSONLibrary
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}     https://api.realworld.io

*** Test Cases ***
Check that query parameter limit is respected
    ${params} =    Create Dictionary    limit=4    offset=0
    ${response}=    GET    ${base_url}/api/articles?       params=${params}     expected_status=200
    ${slug_value_should_exist}=      get value from json    ${response.json()}      $.articles[0].slug
    log to console   ${slug_value_should_exist}
    should not be empty    ${slug_value_should_exist}
    ${slug_value_should_not_exist}=      get value from json    ${response.json()}      $.articles[4].slug
    log to console   ${slug_value_should_not_exist}
    should be empty    ${slug_value_should_not_exist}

Check that query parameter offset is respected
    ${params_offset_0} =    Create Dictionary    limit=3    offset=0
    ${response_offset_0}=    GET    ${base_url}/api/articles?       params=${params_offset_0}     expected_status=200
    ${first_slug_value_offset_0}=      get value from json    ${response_offset_0.json()}      $.articles[0].slug
    log to console   ${first_slug_value_offset_0}
    ${params_offset_1} =    Create Dictionary    limit=3    offset=1
    ${response_offset_1}=    GET    ${base_url}/api/articles?       params=${params_offset_1}     expected_status=200
    ${first_slug_value_offset_1}=      get value from json    ${response_offset_1.json()}      $.articles[0].slug
    log to console   ${first_slug_value_offset_1}
    should not be equal as strings    ${first_slug_value_offset_0}      ${first_slug_value_offset_1}