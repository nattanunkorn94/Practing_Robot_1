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
    เพิ่ม Todo List 'ทำการบ้าน'
    ทำ todo list เสร็จทั้งหมด 'ทำการบ้าน'


สมัคร Form สำเร็จ
    กรอกข้อมูล user 'username' 'firstname' 'lastname'
    เลือกเพศ 'Female'
    เลือกประเทศ 'Thailand'
    เลือกเงื่อนไขและsubmit


เปิดหน้า generate
    # เปิดหน้า generate
    open Exel Sheet
    






    