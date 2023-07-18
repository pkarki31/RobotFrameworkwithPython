*** Settings ***
Library  Browser
Resource    .../../PageResources/LoginPageKeywords.robot

*** Variables ***
${Browser}      chrome
${URL}          https://www.saucedemo.com
${UserName}    standard_user

*** Test Cases ***
LoginTest
    Open My Browser ${URL}  ${Browser}
    Enter UserName  ${UserName}
