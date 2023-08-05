*** Settings ***
Suite Setup       Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
Suite Teardown    Disconnect From Database
Library           DatabaseLibrary
Library           OperatingSystem
Library     SeleniumLibrary
Library     String


*** Variables ***
${DBHost}         localhost
${DBName}         robotDB
${DBPass}         Sai31*
${DBPort}         3306
${DBUser}         root
${URL}      https://www.ebay.com/
${BROWSER-Chrome}        Chrome
${searchCategory}   Computers, Tablets & Network Hardware
${searchModel}  Dell Precision 7760

*** Test Cases ***
#Create person table
#    ${output} =    Execute SQL String    CREATE TABLE employee (emp_id varchar(5) ,first_name varchar(20),last_name varchar(20),department varchar(20));
#    Log    ${output}
#    log to console  ${output}
#    Should Be Equal As Strings    ${output}    None

#Execute SQL Script - Insert Data laptop table
#    ${output} =    Execute SQL Script    SQL/${DBName}_insertData.sql
#    Log    ${output}
#    Should Be Equal As Strings    ${output}    None


#Retrieve DELL laptops from Laptop table
#    ${queryResults} =    Query    SELECT * FROM laptop where company="DELL";
#    log to console      ${queryResults}
#
#Retrieve DELL XPS laptops from Laptop table
#    ${queryResults} =    Query    SELECT * FROM laptop where model_name like '%${searchModel}%';
#    log to console      ${queryResults}

*** Test Cases ***
Validating Product Price from DB and UI  (In Chrome browser)
    Register Keyword To Run On Failure      NONE
    Open Browser   ${URL}    ${BROWSER-Chrome}
    sleep    2 seconds
    Click Element   xpath://*[@id="gdpr-banner-accept"]
    Click Element   id:gh-shop-a
    Click Element   xpath://*[@id="gh-sbc"]/tbody/tr/td[2]/ul[1]/li[1]/a
    Click Element   xpath://div[contains(text(),'PC laptops')]
    Click Element   xpath://p[contains(text(),'Dell') and @class='b-guidancecard__title']
    Click Element   xpath://div[contains(text(),'${searchModel}') and @class='b-info__title ']
    ${priceFromDb} =    Query    SELECT price FROM laptop where model_name like '%${searchModel}%';
    log to console      ${priceFromDb}
    ${DB value}=    Set Variable    ${priceFromDb[0][0]}
    log to console      ${DB value}
    ${priceFromUI}  Get Text    class:display-price
    log to console      ${priceFromUI}
    ${priceWithoutDollarSign} =   Split String  ${priceFromUI}  $
    log to console      ${priceWithoutDollarSign[1]}
    sleep    2 seconds
#    Verify item Price from DB matching with Price with UI
#    Element Should Contain  class:display-price     ${priceFromDb}    Not Matched    True
    Should Be Equal As Strings      ${priceWithoutDollarSign[1]}    ${DB value}
    close browser