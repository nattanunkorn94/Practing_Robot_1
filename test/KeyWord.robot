*** Settings ***
Library           SeleniumLibrary
Resource          /Users/cococake/Desktop/Odds_Mar/Practing_Robot_1/data-test/data-valid.robot

# *** Variable ***
# ${url_facebook}        https://web-demo.qahive.com/todo-list 
# ${title_H1}            Todo List
# ${input_user}          id:email
# ${input_pass}          id:pass
# ${btn_login}           id:loginbutton
# ${message-1}           eating dinner
# ${message-2}           taking shower
# ${message-3}           go to bed





*** Keywords ***
# Verify facebook page
#     [Arguments]               ${title}
#     Title Should Be            ${title}

Open Page Todo
    Open Browser    ${url_facebook}
    Wait Until Element Is Visible   //h1[text()='Todo List']
    Wait Until Element Is Visible  //b[text()='Add Todo']
    
# Input Username and Password
#     [Arguments]      ${xpath_user}       ${xpath_pass}     ${username}       ${password}
#     Element Should Be Visible    ${xpath_user}
#     Element Should Be Visible    ${xpath_pass}
#     Input Text       ${xpath_user}       ${username}
#     Input Text       ${xpath_pass}       ${password}
#

Add Todo List
    # [Arguments]       ${btn}
    Input Text  //input[@data-testid='inputTodo']   ${message-1} 
    Click Button  //button[@type='submit']
    Input Text  //input[@data-testid='inputTodo']   ${message-2}
    Click Button  //button[@type='submit']
    Input Text  //input[@data-testid='inputTodo']   ${message-3}  
    Click Button  //button[@type='submit']

# Make List Done
 