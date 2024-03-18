*** Settings ***
Library    SeleniumLibrary
Library    HttpResponse.Library
Library  Collections
Library  JSONLibrary
Library  SeleniumLibrary
Resource    Collection-keyword.robot

*** Test Cases ***
Get Weather3Hours Should Success and return data
    ${params}=    Create Dictionary    type=json
    ${resp}=    Get WebElements  ${params}
    Log    ${resp.content}



    # Log Json    ${resp.content}


    