*** Settings ***
Library               RequestsLibrary
Library               RPA.JSON  
Library            JSONLibrary
Library            Collections
Library            String
Library             BuiltIn 
Library    RPA.Tables
Library    RPA.Excel.Files


*** Variables ***
${EXCEL_FILE}   ${CURDIR}/../testbook2.xlsx


*** Test Cases ***


test101
    นับจำนวนคนในชีท Summary
    นับจำนวนคนจาก sheet ทั้งหมด



*** Keywords ***
Get row count in the sheet
    [Arguments]      ${SHEET_NAME}
    ${sheet}=        Read Worksheet   ${SHEET_NAME}
    ${rows}=         Get Length  ${sheet}
    [Return]         ${rows}
    
นับจำนวนคนจาก sheet ทั้งหมด
    Open Workbook    ${EXCEL_FILE}
    @{sheets}=   List Worksheets
    FOR  ${sheet}  IN   @{sheets}
    # loop ใน 1 sheet
        ${count}=  Get row count in the sheet   ${sheet}  
        #นับ row
        Log   หน้า ${sheet} มี ${count-1} แถว
    END
นับจำนวนคนในชีท ${sheet} 
    Open Workbook    ${EXCEL_FILE}
    ${count}=  Get row count in the sheet     ${sheet} 
        #นับ row
    Log   หน้า ${sheet} มี ${count-1} แถว
