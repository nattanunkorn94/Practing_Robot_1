*** Settings ***
Library               RequestsLibrary
Library               RPA.JSON  
Library            JSONLibrary
Library        Collections
Library        String
Library         BuiltIn 
# Library        RPA.HTTP


*** Variables ***
# ${url}    



*** Test Cases ***

POST TEST for reqres.on - 1
    # ${response}=    GET  https://api-web-demo.qahive.com
    # ${stations_response}    POST    https://api.nationalize.io/?name=nathaniel 
     ${aa}    Create Dictionary    email=eve.holt@reqres.in   password=cityslicka
     Log      ${aa}
    
    ${response}    POST    url=https://reqres.in/api/login    json=${aa}
    Log    ${response.json()}   
    ${token}    Set Variable    ${response.json()}[token]
    Log    ${token}

    #  ${email}=    Get From Dictionary     ${aa.json()}    email
    # Should Be Equal As Strings    ${expectedname}   ${name}
    # Log    ${email}

    # ${response}=    POST    url=https://reqres.in/api/users    json=${aa}
    # Log    ${response.json()}
    # ${token}    Set Variable    ${response.json()}[token]
    # -------เทียบ value
    # ${bb}     == {"token":"QpwL5tke4Pnpja7X4"}
    # Lists Should Be Equal    ${token}      token:QpwL5tke4Pnpja7X4


POST TEST for reqres.on - 2
    &{req_body}=  Create Dictionary    name=cake      job=team leader
    ${response}=     POST        url=https://reqres.in/api/users    json=${req_body}    expected_status=201
    log      ${response.json()}
    Dictionary Should Contain Key     ${response.json()}    name
    ${ids}=     Get From Dictionary    ${response.json()}    id
    ${name}=    Get From Dictionary     ${response.json()}    name
    # Should Be Equal As Strings    ${expectedname}   ${name}
    ${job}=    Get From Dictionary     ${response.json()}    job
    Log   'Id :' ${ids} 'name is' ${name} 'Job:' ${job}
    # Should Be Equal As Strings    ${expectedjob}    ${job}




Quick Get A JSON Body Test
    ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
    # ถ้าเก็บ respon คือ status ถ้าเอา respon.jsonถึงจะได้ parameter
    Should Be Equal As Strings    1  ${response.json()}[id]

    ${title}=     Get From Dictionary    ${response.json()}    title
    Log    ${title}
    Log    ${response}
    # respon = status


Get API Should Success and return data
    &{params}=    Create Dictionary    name=cake
    # Log     ${params}
    ${resp}=    Get API methods   ${params}
    Status Should Be     200    ${resp}
     Log    ${resp}

    # Log To Console   ${resp.content}
    # Response Status should be Success    ${resp}




*** Keywords ***
Get API methods
   [Arguments]    ${params}
    Create Session    tmd    https://reqres.in/api
    ${resp}=   GET On Session    tmd    /login    params=${params}
#    /Weather3Hours/V1 
    Return From Keyword    ${resp}
    

Response Status should be Success
    [Arguments]    ${resp}
    Should Be Equal As Strings    ${resp.status_code}    200