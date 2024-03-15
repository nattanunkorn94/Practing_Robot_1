*** Settings ***
Library     RequestsLibrary
Library     RPA.JSON
Library     JSONLibrary
Library     Collections
Library     String
Library     BuiltIn

*** Keywords ***
Get API methods
    [Arguments]    ${params}
    Create Session    tmd    https://reqres.in/api
    ${resp}=    GET On Session    tmd    /login    params=${params}
#    /Weather3Hours/V1
    RETURN    ${resp}

Response Status should be Success
    [Arguments]    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200
    Log    ${resp.status_code}
    Log    ${resp}