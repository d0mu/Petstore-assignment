*** Settings ***
Library                 Selenium2Library
Library                 MyLibrary

*** Variables ***
${SERVER}               http://localhost:3000/
${BROWSER}              Chrome
${DELAY}                0

*** Test Cases ***
US0001 - Viewing the current date
    Given Petstore app is running
    Then The current date is displayed in the format DD-MM-YYYY
    And The background color of the banner is black

*** Keywords ***
Petstore app is running
    open browser  ${SERVER}   ${BROWSER}

The current date is displayed in the format DD-MM-YYYY
    ${date}=    get today date
    element should contain  xpath=//span[@class='banner-date']  ${date}

The background color of the banner is black
    ${style}=   get element attribute    xpath=//div[@class='assignment-masthead']@style

    [Teardown]    Close Browser