*** Settings ***

Library    Browser
#Library  SeleniumLibrary
Variables  ../PageLocators/locators.py


*** Keywords ***
Open My Browser
        [Arguments]     ${URL}      ${browser}
        Open Browser        ${URL}      ${browser}

Enter UserName
        [Arguments]  ${username}
        Fill Text       ${loginUserName}        ${username}

Time to wait
        Wait Until Network Is Idle

Enter Password
        [Arguments]  ${password}
        Fill Text       ${loginPassword}        ${password}

Click Login
        Click       ${LoginButton}

Add Product 1 to Cart
        Click       ${addProduct1tocart}

Add Product 2 to Cart
        Click       ${addProduct2tocart}

Verify Product count in Shopping Cart
        [Arguments]  ${cartCount}
        ${CartItem}    Get Text     ${badgeShoppingCart}
        Should Be Equal    ${CartItem}    ${cartCount}


