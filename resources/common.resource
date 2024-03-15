*** Settings ***
Library     SeleniumLibrary
Library     RPA.Excel.Files
Library     RPA.Tables
Library     Collections
Library     ../.venv/lib/python3.11/site-packages/RPA/Desktop/__init__.py
Library     XML
Library     RequestsLibrary
Library     RPA.JSON
Library     JSONLibrary
Library     Collections
Library     String
Library     BuiltIn


*** Variables ***
# todo page
${url_todo}         https://web-demo.qahive.com/todo-list
${title_H1}         Todo List

# @{list2}            @{EMPTY}
@{list}     1    2    3    4
@{list2}    5    6    7    8

# Form page
${url_form}         https://web-demo.qahive.com/form-demo
${username001}      cake@gmail.com
${firstname001}     kunA
${lastname001}      lastnameA
${password001}      1234
