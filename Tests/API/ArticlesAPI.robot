*** Settings ***
Documentation  Testing the Articles API
Library     JSONLibrary
Library  RequestsLibrary

*** Variables ***
${base_url}     https://api.realworld.io

*** Test Cases ***
Check that query parameter limit is respected
    ${params_limit_4} =    Create Dictionary    limit=4    offset=0
    ${response}=    GET    ${base_url}/api/articles?       params=${params_limit_4}     expected_status=200
    ${limit_param_first_article_slug_value}=      get value from json    ${response.json()}      $.articles[0].slug
    should not be empty    ${limit_param_first_article_slug_value}
    ${limit_parmfifth_article_slug_value}=      get value from json    ${response.json()}      $.articles[4].slug
    should be empty    ${limit_parmfifth_article_slug_value}

Check that query parameter offset is respected
    ${params_offset_0} =    Create Dictionary    limit=3    offset=0
    ${response_offset_0}=    GET    ${base_url}/api/articles?       params=${params_offset_0}     expected_status=200
    ${offset_0_first_article_slug_value}=      get value from json    ${response_offset_0.json()}      $.articles[0].slug
    ${params_offset_1} =    Create Dictionary    limit=3    offset=1
    ${response_offset_1}=    GET    ${base_url}/api/articles?       params=${params_offset_1}     expected_status=200
    ${offset_1_first_article_slug_value}=      get value from json    ${response_offset_1.json()}      $.articles[0].slug
    should not be equal as strings    ${offset_0_first_article_slug_value}      ${offset_1_first_article_slug_value}

Check that query parameter tag is respected
    ${params_tag_welcome} =    Create Dictionary        tag=welcome     limit=10    offset=0
    ${response_tag_weldcome}=    GET    ${base_url}/api/articles?       params=${params_tag_welcome}     expected_status=200
    ${taglist_first_article_tag_welcome}=      get value from json    ${response_tag_weldcome.json()}      $.articles[0].tagList
    ${string_taglist_first_article_tag_welcome}=        convert to string      ${taglist_first_article_tag_welcome}
    should contain      ${string_taglist_first_article_tag_welcome}     welcome