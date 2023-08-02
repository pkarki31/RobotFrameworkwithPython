*** Settings ***
Suite Setup       Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
Suite Teardown    Disconnect From Database
Library           DatabaseLibrary
Library           OperatingSystem


*** Variables ***
${DBHost}         localhost
${DBName}         robotDB
${DBPass}         Sai31*
${DBPort}         3306
${DBUser}         root

*** Test Cases ***
#Create person table
#    ${output} =    Execute SQL String    CREATE TABLE employee (emp_id varchar(5) ,first_name varchar(20),last_name varchar(20),department varchar(20));
#    Log    ${output}
#    log to console  ${output}
#    Should Be Equal As Strings    ${output}    None

Execute SQL Script - Insert Data laptop table
    ${output} =    Execute SQL Script    SQL/${DBName}_insertData.sql
    Log    ${output}
    Should Be Equal As Strings    ${output}    None


Retrieve DELL laptops from Laptop table
    ${queryResults} =    Query    SELECT * FROM laptop where company="DELL";
    log to console      ${queryResults}

Retrieve DELL XPS laptops from Laptop table
    ${queryResults} =    Query    SELECT * FROM laptop where model_name like '%Latitude%';
    log to console      ${queryResults}
