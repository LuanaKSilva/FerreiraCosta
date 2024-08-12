*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CLOSE_BTN}           //button[@data-cy='button-close-modal-cookie']
${SITE_NAME}            https://www.ferreiracosta.com/
${SITE_NAME_EXPECTED}    Ferreira Costa | Tudo para Casa, Construção e Decoração

*** Keywords ***
Start Page
    Open Browser               ${SITE_NAME}    googlechrome
    Title Should Be            ${SITE_NAME_EXPECTED}
    Maximize Browser Window  
    Click Button               ${CLOSE_BTN}      
    
Close Page
    Capture Page Screenshot
    Close Browser