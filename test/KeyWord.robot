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

เพิ่ม Todo List
    # [Arguments]       ${btn}
    Input Text  //input[@data-testid='inputTodo']   ${message-1} 
    Click Button  //button[@type='submit']
    Input Text  //input[@data-testid='inputTodo']   ${message-2}
    Click Button  //button[@type='submit']
    Input Text  //input[@data-testid='inputTodo']   ${message-3}  
    Click Button  //button[@type='submit']

ทำ todo list เสร็จทั้งหมด
    
    # Element Text Should Be     (//div[@class='todo']//span)[2]   ${message-1}  # robotcode: ignore
    # Click Button   //button[@data-testid='markDone']    
    # Click Button   //button[@data-testid='markDone']
    Click Button   (//button[text()='✓'])[1]
    Click Button   (//button[text()='✓'])[2]
    Click Button   (//button[text()='✓'])[3]
    # Scroll Element Into View     (//button[text()='✓'])[4]
    # Click Button   (//button[text()='✓'])[4]
    #  ${message-1}  == Get Text 
    # //span[text()='This is a sampel todo']
    # IF  Get Text //div[@class='todo'])[3] == ${message-1} 
    #    Click Button   //button[@data-testid='markDone']   
    # END

# For Loop
#     # ${BB} =    Get Element Count     //button[text()='✓']      
#     FOR  ${i}  IN  2
#     Click Button   (//button[text()='✓'])[${i}]
#     END

กรอกข้อมูล username 
    Open Browser    ${url_form} 
    Maximize Browser Window
    Input Text     //label[text()='username*']/following::input    ${username001}
    Input Text    //label[text()='firstname*']/following::input    ${firstname001} 
    Input Text    //label[text()='lastname*']/following-sibling::input    ${lastname001}  

เลือกเพศ '${gender}'
     Click Element    //input[@value='${gender}']

เลือกประเทศ 
    # Click Element      //label[@class='form-label']/following-sibling::select[1]  
       
    Checkbox Should Be Selected        //input[@type='checkbox']
    # Select From List By Label   //label[@class='form-label']/following-sibling::select[1]    "Hongkong"  

เลือกเงื่อนไข
    Click Element     //input[@type='checkbox']  
    