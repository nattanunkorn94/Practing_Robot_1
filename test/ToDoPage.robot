*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Resource   KeyWord.robot
# Suite Setup        Open Browser    about:blank    chrome
# Suite Teardown     Close All Browsers



*** Test Cases ***
Open Right Page
    Open Page Todo
    Add Todo List
    # Open Browser    ${url_facebook}
    # Wait Until Element Is Visible   //h1[text()='Todo List']
    # Wait Until Element Is Visible  //b[text()='Add Todo']
  
# Login facebook - Fail
#     [tags]    fail
#     Go To           ${url_facebook}
    # Verify facebook page           ${title_H1}
#     Input Username and Password    ${input_user}     ${input_pass}       ${username_fail}      ${password_fail}
#     Click Button Login          ${btn_login}
#     Verify Login Fail

# Login facebook - success
#     [tags]    success
#     Go To           ${url_facebook}
#     Verify facebook page           ${title_H1}
#     Input Username and Password    ${input_user}     ${input_pass}       ${username_success}      ${password_success}
#     Click Button Login          ${btn_login}
#     Verify Login Success           ${txt_message}




    