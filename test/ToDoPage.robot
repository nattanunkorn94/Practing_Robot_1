*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Resource   KeyWord.robot
# Suite Setup        Open Browser    about:blank    chrome
# Suite Teardown     Close All Browsers



*** Test Cases ***
User เข้าไปทำการเพิ่ม ToDo List 
    Open ToDoList Page
    เพิ่ม Todo List
    ทำ todo list เสร็จทั้งหมด


สมัคร Form สำเร็จ
    กรอกข้อมูล username 
    เลือกเพศ 'Female'
    เลือกประเทศ 







    