*** Settings ***
Library               RequestsLibrary
Library               RPA.JSON  
Library            JSONLibrary
Library        Collections
Library        String
Library         BuiltIn 
# Library        RPA.HTTP


*** Variables ***
${url}    https://www.google.com

@{header_response}        Title    Description    Uri    LastBuiltDate
...    CopyRight    Generator
@{stations_response}        WmoNumber    StationNameTh    StationNameEng
...    Province    Latitude    Longitude    Observe

*** Test Cases ***

Get Weather3Hours Should Success and return data
       &{params}=    Create Dictionary    type=json
    ${resp}=    Get Weather3Hours    ${params}
     Log    ${resp}

    # Log To Console   ${resp.content}
    # Response Status should be Success    ${resp}
Quick Get Request Test
    ${response}=    GET  https://www.google.com

Quick Get Request With Parameters Test
    ${response}=    GET  https://www.google.com/search  params=query=ciao  expected_status=200
     Log    ${response}


Quick Get A JSON Body Test
    ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
    Should Be Equal As Strings    1  ${response.json()}[id]
    Log    ${response}







*** Keywords ***
Get Weather3Hours
   [Arguments]    ${params}
    Create Session    tmd    ${url}
    ${resp}=   GET On Session    tmd    /Weather3Hours/V1    params=${params}
#    /Weather3Hours/V1 
    Return From Keyword    ${resp}
    

Response Status should be Success
    [Arguments]    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200