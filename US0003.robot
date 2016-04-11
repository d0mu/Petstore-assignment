*** Settings ***
Library                 Selenium2Library
Test Teardown           Close Browser

*** Variables ***
${SERVER}               http://localhost:3000/
${BROWSER}              Chrome
${DELAY}                0

*** Test Cases ***
US0003 - Adding a new pet - using the mouse
    Given Petstore app is running
    When I input the pet name
    And I input the pet status
    And I click the create button
    Then the pet is added to the list

US0003 - Adding a new pet - using the keyboard
    Given Petstore app is running
    When I input the pet name
    And I hit the TAB key in the name field
    And I type the pet status
    And I hit the ENTER key in the status field
    Then the pet is added to the list

*** Keywords ***
Petstore app is running
    open browser  ${SERVER}   ${BROWSER}

I input the pet name
    input text  xpath=//input[@class='form-control pet-name']    Pixie

I input the pet status
    input text  xpath=//input[@class='form-control pet-status']  Not for sale

I click the create button
    click button  id=btn-create

The pet is added to the list
    wait until page contains    Pixie
    table column should contain    xpath=//table[@class='table table-hover']    1    Pixie
    table column should contain    xpath=//table[@class='table table-hover']    2    Not for sale

I hit the TAB key in the name field
    press key  xpath=//input[@class='form-control pet-name']    \\9

I type the pet status
    input text  xpath=//input[@class='form-control pet-status']  Not for sale

I hit the ENTER key in the status field
    press key  xpath=//input[@class='form-control pet-status']    \\13

