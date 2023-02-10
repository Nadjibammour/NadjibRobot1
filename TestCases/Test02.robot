*** Settings ***
Documentation       Ce cas de test permet de reserver une demo gratuite sur le site OranDemo.
...                 (handle window, switch to window)

Library             SeleniumLibrary
Library             SeleniumLibrary

Test Setup          Ouvrir site dans le le navigateur
Test Teardown       Close Browser


*** Variables ***
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}      chrome


*** Test Cases ***
Reserver une demo gratuite
    Cliquer sur le lien orangeHRM.com
    Switcher vers une autre fenetre
    Reserver sur une demo gratuite


*** Keywords ***
Ouvrir site dans le le navigateur
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s

Cliquer sur le lien orangeHRM.com
    Click Link    css:a[href='http://www.orangehrm.com']
    Sleep    2s

Switcher vers une autre fenetre
    @{ListWindows}=    Get Window Handles
    Log To Console    @{ListWindows}
    Switch Window    ${ListWindows}[1]
    Sleep    2s

Reserver sur une demo gratuite
    Click Button    //*[@id='navbarSupportedContent']/div[2]/ul/li[1]/a/button
    Sleep    2
    Input Text    //input[@id='Form_getForm_FullName']    farid
    Input Text    name:Email    farid@gmail.com
    Input Text    css:#Form_getForm_Contact    514432223
    Click Element    id:Form_getForm_action_submitForm
