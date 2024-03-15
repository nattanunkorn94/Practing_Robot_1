*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Library     RPA.Excel.Files
Library     RPA.Tables
Library     Collections
# Resource          ../resources/common.resource


*** Keywords ***
Get row count in the sheet
    [Arguments]      ${SHEET_NAME}
    ${sheet}=        Read Worksheet   ${SHEET_NAME}
    ${rows}=         Get Length  ${sheet}
    [Return]         ${rows}
    
นับจำนวนคนจาก sheet ทั้งหมด
    Open Workbook    ${CURDIR}/../testbook2.xlsx
    @{sheets}=   List Worksheets
    FOR  ${sheet}  IN   @{sheets}
    # loop ใน 1 sheet
        ${count}=  Get row count in the sheet   ${sheet}  
        #นับ row
        Log   หน้า ${sheet} มี ${count-1} แถว
    END

นับจำนวนคนในชีท ${sheet} 
    Open Workbook    ${CURDIR}/../testbook2.xlsx
    ${count}=  Get row count in the sheet     ${sheet} 
        #นับ row
    Log   หน้า ${sheet} มี ${count-1} แถว
