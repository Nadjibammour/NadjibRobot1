*** Settings ***
Documentation       Cette suite est pour expliquer le mecanisme d'attente statique et dynamique
...                 (sleep, explicit wait, implicit wait)

Library             SeleniumLibrary

Test Setup          ouvrir le navigateur
Test Teardown       Close Browser


*** Variables ***
${URL}              https://demowebshop.tricentis.com/register
${BROWSER}          chrome
${vGenre}           M
${vFirstName}       prenomtest
${vLastName}        nomtest
${vEmail}           nadjib.ammour@gmail.com
${Pass}             Test12345678


*** Test Cases ***
Test synchronisation
    ${Attente}=    Get Selenium Timeout
    Log To Console    ${Attente}
    Set Selenium Timeout    10
    ${Attente}=    Get Selenium Timeout
    Log To Console    ${Attente}
    # Set Selenium Speed    2
    #${Attente}=    Get Selenium Implicit Wait
    #Log To Console    ${Attente}
    #Set Selenium Implicit Wait    20

    When selectionner un genre    ${vGenre}
    Wait Until Element Is Visible    id:FirstName
    And saisir first name    ${vFirstName}
    And saisir last name    ${vLastName}
    And saisir email    ${vEmail}
    And saisir password    ${Pass}
    And confirm password    ${Pass}
    And click enregistrer
    Then Confirm Registration


*** Keywords ***
ouvrir le navigateur
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

selectionner un genre
    [Arguments]    ${vGenre}
    Select Radio Button    Gender    ${vGenre}

saisir first name
    [Arguments]    ${vFirstName}
    Input Text    xpath://input[@name="FirstName"]    ${vFirstName}

saisir last name
    [Arguments]    ${vLastName}
    Input Text    xpath://input[@name="LastName"]    ${vLastName}

saisir email
    [Arguments]    ${vEmail}
    Input Text    xpath://input[@name="Email"]    ${vEmail}

saisir password
    [Arguments]    ${Pass}
    Input Text    xpath://input[@name="Password"]    ${Pass}

confirm password
    [Arguments]    ${Pass}
    Input Text    xpath://input[@name="ConfirmPassword"]    ${Pass}

click enregistrer
    Click Button    xpath://input[@id="register-button"]

Confirm Registration
    Page Should Contain    Your registration completed
