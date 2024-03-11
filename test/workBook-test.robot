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
Rows in the sheet
    [Setup]      Open Workbook    ${EXCEL_FILE}
    @{sheets}=   List Worksheets
    Log  ${sheets}
    FOR  ${sheet}  IN   @{sheets}
    # loop ใน 1 sheet
        ${count}=  Get row count in the sheet   ${sheet}  
        #นับ row
        Log   CAKE say Worksheet ${sheet} has ${count} rows
    END
   




*** Keywords ***
Get row count in the sheet
    [Arguments]      ${SHEET_NAME}
    ${sheet}=        Read Worksheet   ${SHEET_NAME}
    ${rows}=         Get Length  ${sheet}
    [Return]         ${rows}
    
