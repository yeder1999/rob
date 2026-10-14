*** Settings ***
Documentation    Mots-clés communs
Library    SeleniumLibrary

*** Variables ***
${URL}       https://practiceautomatedtesting.com/shopping
${BROWSER}   chrome

*** Keywords ***
Init
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    5s

Fermer
    Close All Browsers