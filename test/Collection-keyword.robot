*** Settings ***
Resource    ../resources/common.resource





*** Keywords ***
Test-1 ${message-1}
    Open Browser    ${url_todo}
    Wait Until Element Is Visible    //h1[text()='Todo List']
    Wait Until Element Is Visible    //b[text()='Add Todo']
    # Append To List    (//div[@class='card-body'])[3]    @{list2}

    # [Arguments]    ${list2}
    Input Text    //input[@data-testid='inputTodo']    ${message-1}
    Click Button    //button[@type='submit']
    ${a}    Convert To List    (//div[@class='card-body'])[3]
    Append To List    ${list2}    @{a}
    Log    ${list2}
