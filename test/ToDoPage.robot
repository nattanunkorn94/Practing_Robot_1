*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Resource   KeyWord.robot

# Suite Setup        Open Browser    about:blank    chrome
# Suite Teardown     Close All Browsers



*** Test Cases ***
User เข้าไปทำการเพิ่ม แล้ว make it done แล้ว delete
    Open ToDoList Page
    เพิ่ม Todo List 'อันที่2' 
    เพิ่ม Todo List 'อันที่3'
    เพิ่ม Todo List 'อันที่4'

    ทำ todo list เสร็จทั้งหมด
    ลบ todo list ได้ทั้งหมด
   
   



สมัคร Form สำเร็จ
    กรอกข้อมูล user 'username' 'firstname' 'lastname'
    เลือกเพศ 'Female'
    เลือกประเทศ 'Thailand'
    เลือกเงื่อนไขและsubmit


เปิดหน้า generate
    # เปิดหน้า generate
    open Exel Sheet testbook2.xlsx
    






    