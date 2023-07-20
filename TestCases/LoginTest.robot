*** Settings ***
Library  Browser
#Library  SeleniumLibrary
Resource    ../PageResources/LoginPageKeywords.robot

*** Variables ***
${Browser}      chromium
${URL}          https://www.saucedemo.com
${UserName}    standard_user
${PassWord}    secret_sauce


*** Test Cases ***
LoginTest
    Open My Browser     ${URL}      ${Browser}
    Enter UserName      ${UserName}
    Enter Password      ${Password}
    Click Login
    Add Product 1 to Cart
    Add Product 2 to Cart
    Verify Product count in Shopping Cart       2

