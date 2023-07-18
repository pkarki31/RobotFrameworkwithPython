*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library     SeleniumLibrary
Library     Screenshot

*** Variables ***
${LOGIN URL}      https://google.com
${BROWSER}        Chrome

*** Keywords ***
Set Screenshot Directory    RobotFrameworkwithPython/CaptureScreenShot123

*** Test Cases ***
Valid Login
    Open Browser   ${LOGIN URL}    ${BROWSER}
    Scroll Element Into View    xpath://*[@id="L2AGLb"]/div1
    Click Element   xpath://*[@id="L2AGLb"]/div
    set selenium implicit wait    10 seconds
    close browser
