*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Resource   workBook-keyword.robot

# Suite Setup        Open Browser    about:blank    chrome
# Suite Teardown     Close All Browsers



*** Test Cases ***

test101
    นับจำนวนคนในชีท Summary
    นับจำนวนคนจาก sheet ทั้งหมด