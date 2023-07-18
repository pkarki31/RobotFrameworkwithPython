*** Settings ***

Library    Browser
Variables  ../PageLocators/locators.py


*** Keywords ***
Open My Browser
    [Arguments] ${URL}  ${Browser}
    Open Browser    ${URL}  ${Browser}

Enter UserName
    [arguments] ${username}
    Fill Text   ${loginUserName}    ${username}


