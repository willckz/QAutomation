*** Settings ***
Library    Browser

*** Variables ***
${BROWSER}             chromium
${HEADLESS}            ${false}
${URL_PLATAFORMA}      https://qa-testeerp.agrotis.io 


*** Keywords ***
Abrir a Plataforma
    New Browser      browser=${BROWSER}    headless=${HEADLESS}    args=["-start-maximized"]
    New Context      viewport=${None}
    New Page         ${URL_PLATAFORMA}




