*** Settings ***
Library    Browser
Library  Browser
*** Variables ***
${URL}  https://www.saucedemo.com
${UserName}    standard_user
${PassWord}    secret_sauce
${EmptyCartvalue}    0
${FirstName}    Test
${LatsName}    Test1
${Zip}    12345

*** Test Cases ***

Scenario 2: Add and Complete the order
    Open Browser    ${URL}    browser=chromium
    Fill Text    id=user-name    ${UserName}    #Login
    Fill Text    //*[@id="password"]    ${PassWord}
    Click    //*[@id="login-button"]                    #Add Items to cart
    Click    (//*[text()='Add to cart'])[1]
    Click    (//*[text()='Add to cart'])[2]
    ${CartItem}    Get Text    //*[@class="shopping_cart_badge"]
    Should Be Equal    ${CartItem}    2                  #Verify item count
    Click    //*[@id="shopping_cart_container"]/a
    ${CartItemviewCount}    Get Element Count    //*[@class="cart_item"]
    Should Be Equal As Integers    ${CartItemviewCount}    2        #verify cart count
    Click    //*[@id="checkout"]                                    #Checkout
    Fill Text    //*[@id="first-name"]    ${FirstName}
    Fill Text    //*[@id="last-name"]    ${LatsName}
    Fill Text    //*[@id="postal-code"]    ${Zip}
    Click    //*[@id="continue"]
    ${Cartqty1}    Get Text    (//*[@class="cart_quantity"])[1]      #Verify Quantity
    Should Be Equal    ${Cartqty1}    1
    ${Cartqty2}    Get Text    (//*[@class="cart_quantity"])[2]
    Should Be Equal    ${Cartqty2}    1
    ${total}    Get Text    //*[@class="summary_info_label summary_total_label"]
    Should Be Equal   ${total}    Total: $49.66                      #Verify total
    Take Screenshot
    Click    //*[@id="finish"]
    Take Screenshot
    ${Confirmation Message}    Get Text    //*[@id="checkout_complete_container"]/h2
    Should Be Equal    ${Confirmation Message}    Thank you for your order!        #Verify order complete message
    Close Browser