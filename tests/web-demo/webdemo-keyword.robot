*** Settings ***
# Resource        ../resources/common.resource
Library     SeleniumLibrary
Library     RPA.Excel.Files
Library     RPA.Tables
Library     Collections
*** Keywords ***
# Verify facebook page
#     [Arguments]               ${title}
#     Title Should Be            ${title}


##### Web DEMO #####
Open ToDoList Page
    Open Browser    https://web-demo.qahive.com/todo-list
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
    # Execute Javascript    ( 0,500 ) 
    # ยังทำ scroll to view ไม่ได้
     FOR    ${no}    IN RANGE   ${BB}
        # Scroll Element Into View    (//button[@type='button'])[6]
        # Wait Until Element Is Visible    (//button[@type='button'])[6]  timeout=6000
        Click Element   (//button[text()='✓'])[${no}+1]
        Log    ${no}
     END

ลบ todo list ได้ทั้งหมด
    # Click Element   (//button[text()='✕'])[1]
    ${nn}=  Get Element Count    //button[@data-testid='markRemove']
    Log     ${nn}

    FOR   ${var}    IN RANGE    ${nn}
    Click Element    //button[text()='✕']
    END
    


กรอกข้อมูล user '${username}' '${firstname}' '${lastname}'
    Open Browser     https://web-demo.qahive.com/form-demo
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




##### Exel , WorkBook #####
open Exel Sheet ${workbook}
    Open Workbook    ${workbook}
    Set Active Worksheet    Summary
    ${data}    Read Worksheet    header=${TRUE}
    ${orders}=       Create table     ${data}
    Add table column    ${orders}    name=TOS    values='nana'
    Log   ${orders}


    