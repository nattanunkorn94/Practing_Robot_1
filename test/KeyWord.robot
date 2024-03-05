*** Settings ***
Library           SeleniumLibrary
Library    XML
Resource          data-valid.robot

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

Open ToDoList Page
    Open Browser    ${url_todo}
    Wait Until Element Is Visible   //h1[text()='Todo List']
    Wait Until Element Is Visible  //b[text()='Add Todo']
    
# Input Username and Password
#     [Arguments]      ${xpath_user}       ${xpath_pass}     ${username}       ${password}
#     Element Should Be Visible    ${xpath_user}
#     Element Should Be Visible    ${xpath_pass}
#     Input Text       ${xpath_user}       ${username}
#     Input Text       ${xpath_pass}       ${password}
#

เพิ่ม Todo List '${message-1}'
    # [Arguments]       ${btn}
    Input Text  //input[@data-testid='inputTodo']   ${message-1} 
    Click Button  //button[@type='submit']
    

ทำ todo list เสร็จทั้งหมด '${message-1}'
    # VAR    ${a}      //span[text()='This is a sampel todo'] 
    # IF  ${message-1} ==  ${message-1}
    #     Click Element  //button[text()='✓']
    # END
    
    Click Element   //span[text()='${message-1}']    # robotcode: ignore
    # Click Button   //button[@data-testid='markDone']    
    # Click Button   //button[@data-testid='markDone']
    Click Element   //span[text()='This is a sampel todo']  
    # Click Button   (//button[text()='✓'])[1]


# For Loop
#     # ${BB} =    Get Element Count     //button[text()='✓']      
#     FOR  ${i}  IN  2
#     Click Button   (//button[text()='✓'])[${i}]
#     END

กรอกข้อมูล user '${username}' '${firstname}' '${lastname}'
    Open Browser    ${url_form} 
    Maximize Browser Window
    Input Text     //label[text()='username*']/following::input    ${username}
    Input Text    //label[text()='firstname*']/following::input    ${firstname} 
    Input Text    //label[text()='lastname*']/following-sibling::input    ${lastname}  


เลือกเพศ '${gender}'
     Click Element    //input[@value='${gender}']

เลือกประเทศ '${country}'
    Select From List By Label   //label[@class='form-label']/following-sibling::select[1]       ${country}   

เลือกเงื่อนไขและsubmit
    Click Element     //input[@type='checkbox'] 
    Click Element    //button[@type='submit']     


