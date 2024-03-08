*** Settings ***
Library           SeleniumLibrary
Library            XML
Resource          data-valid.robot
Library      RPA.Excel.Files
Library    RPA.Tables
Library    Collections
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
    # [Arguments]       ${list2}
    Input Text  //input[@data-testid='inputTodo']   ${message-1} 
    Click Button  //button[@type='submit']
    


ทำ todo list ลำดับที่'${message-1}'
    Click Element   (//button[text()='✓'])[${message-1}] 
      # robotcode: ignore
 
ลบ todo list ลำดับที่'${message-1}'
    Click Element   (//button[text()='✕'])[${message-1}]
   

ทำ todo list เสร็จทั้งหมด
    # Click Element   (//button[text()='✓'])
    Maximize Browser Window
    ${BB} =  Get Element Count      //button[text()='✓']
    Log     ${BB} 
    Execute Javascript    ( 0,500 ) 
     FOR    ${no}    IN RANGE   ${BB}
        # Scroll Element Into View    (//button[@type='button'])[6]
        # Wait Until Element Is Visible    (//button[@type='button'])[6]  timeout=6000
        Click Element   (//button[text()='✓'])[${no}+1]
        Log    ${no}
     END




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




เปิดหน้า generate
    Open Browser    https://web-demo.qahive.com/test-data-generator
    Click Element    //input[@name='fullNameEN']
    Click Element    //input[@name='genderEN']
    Click Button    //button[text()='Generate']
    Click Button    //button[text()='Export']
    # Click Element    //li[text()='Download as CSV']

open Exel Sheet
    Open Workbook     ${CURDIR}/../testbook2.xlsx
    Set Active Worksheet    FlatWhi te
    ${data}    Read Worksheet    header=${TRUE}
    ${orders}=       Create table     ${data}
    Log   ${orders}
    Add table column    ${orders}    name=TOS    values='nana'
    # [Return]         ${orders}
    Log   ${orders}

    Add table row    ${orders}   testerer
    ${orders}    Read Worksheet    
  
    
    
    # [Teardown]       Close workbook
    