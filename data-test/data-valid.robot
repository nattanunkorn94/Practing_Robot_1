*** Settings ***
Library           SeleniumLibrary

*** Variable ***
${url_facebook}        https://web-demo.qahive.com/todo-list 
${title_H1}            Todo List
${input_user}          id:email
${input_pass}          id:pass
${btn_login}           id:loginbutton
${message-1}           eating dinner
${message-2}           taking shower
${message-3}           go to bed