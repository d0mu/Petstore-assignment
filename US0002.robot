*** Settings ***
Library                 Selenium2Library

*** Variables ***
${SERVER}               http://localhost:3000/
${BROWSER}              Chrome
${DELAY}                0

*** Test Cases ***
US0002 - Viewing my pets
    Given Petstore app is running
    Then The list of pets displayed in a table like component
    And My pets can be identified by Name and Status

*** Keywords ***
Petstore app is running
    open browser  ${SERVER}   ${BROWSER}

The list of pets displayed in a table like component
    element should be visible  xpath=//table[@class='table table-hover']

My pets can be identified by Name and Status
    table header should contain  xpath=//table[@class='table table-hover']  Name
    table header should contain  xpath=//table[@class='table table-hover']  Status

    [Teardown]    Close Browser