*** Settings ***
Library                 Selenium2Library
Library                 Catenate
Test Teardown           Close Browser

*** Variables ***
${SERVER}               http://localhost:3000/
${BROWSER}              Chrome
${DELAY}                0
${TEXT}

*** Test Cases ***
US0004 - Modifying an existing pet - edit name and discard changes using ESC
    Given Petstore app is running
    When I click on a pet name
    And I edit the text
    And I hit the ESC key
    Then the changes are not saved

US0004 - Modifying an existing pet - edit name and save changes using the ENTER
    Given Petstore app is running
    When I click on a pet name
    And I edit the text
    And I hit the ENTER key
    Then the changes are saved

US0004 - Modifying an existing pet - edit name and save changes using the mouse
    Given Petstore app is running
    When I click on a pet name
    And I edit the text
    And I do mouse out
    Then the changes are saved

*** Keywords ***
Petstore app is running
    open browser  ${SERVER}   ${BROWSER}

I click on a pet name
    ${TEXT}=    get text  xpath=//span[@class='pet lbl pet-name']
    click element  xpath=//span[@class='pet lbl pet-name']

I edit the text
    press key  xpath=//input[@class='pet usr-input pet-name']     Dixie

I hit the ESC key
    press key  xpath=//input[@class='pet usr-input pet-name']    \\27

The changes are not saved
    table column should contain    xpath=//table[@class='table table-hover']    1    ${TEXT}

I hit the ENTER key
    press key  xpath=//input[@class='pet usr-input pet-name']    \\13
    wait until page contains    Pixie

The changes are saved
    ${TEXT} =	Catenate	SEPARATOR=  ${TEXT}    Dixie
    wait until page contains    ${TEXT}

I do mouse out
    click element   xpath=//h1[@class='assignment-title']