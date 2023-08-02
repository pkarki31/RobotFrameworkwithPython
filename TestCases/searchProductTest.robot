*** Settings ***

Library     SeleniumLibrary


*** Variables ***
${URL}      https://www.ebay.com/
${BROWSER-Chrome}        Chrome
${BROWSER-Safari}        safari
${searchCategory}   Computers/Tablets & Networking
${searchProduct}    MacBook

*** Test Cases ***
Validating Product Search by Category (In Chrome browser)
    Register Keyword To Run On Failure      NONE
    Open Browser   ${URL}    ${BROWSER-Chrome}
    sleep    2 seconds
    Click Element   xpath://*[@id="gdpr-banner-accept"]
    input text  xpath://input[@aria-label='Search for anything']     ${searchProduct}
    Select From List By Label   //select[@aria-label='Select a category for search']    ${searchCategory}
    click element   //input[@value='Search']

    #Verify item title
    Element Should Contain  xpath://*[@id="item4d8cbf0397"]/div/div[2]/a     ${searchProduct}    Not Matched    True
    close browser

Validating Product Search by Category (In safari browser)
    Register Keyword To Run On Failure      NONE
    Open Browser   ${URL}    ${BROWSER-Safari}
    sleep    2 seconds
    Click Element   xpath://*[@id="gdpr-banner-accept"]
    input text  xpath://input[@aria-label='Search for anything']     ${searchProduct}
    Select From List By Label   //select[@aria-label='Select a category for search']    ${searchCategory}
    click element   //input[@value='Search']
    Wait Until Element Is Visible   xpath://*[@id="item4d8cbf0397"]/div/div[2]/a
    #Verify item title
    Element Should Contain  xpath://*[@id="item4d8cbf0397"]/div/div[2]/a     ${searchProduct}    Not Matched    True
    close browser

