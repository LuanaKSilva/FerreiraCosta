*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${EXPECTED_URL}              https://www.ferreiracosta.com/
${SEARCH_BAR}                id=searchProduct
${SEARCH_BTN}                xpath=//span[contains(@data-cy,'search-product-hyperlink')]
${SEARCH_RESULTS_TITLE}      xpath=//div[@data-cy='search-result-title'][contains(.,'Pesquisa por: "Ar-Condicionado"')]
${SEARCH_RESULTS_COUNTER}    xpath=//div[@data-cy='search-result-counter'][contains(.,' Produtos')]
${TITLE_CARD}                xpath=//h3[@data-cy='product-card-title'][contains(.,'')]

### Indíce da lista               0                1        
@{MY_LIST_OF_PRODUCTS}   Ar-Condicionado  Ar Condicionado

*** Keywords ***
Dado que o usuário está na página principal do site Ferreira Costa
    Location Should Be                  ${EXPECTED_URL}   

E há um campo de pesquisa visível no topo da página
    Wait Until Page Contains Element    ${SEARCH_BAR}

Quando o usuário digita "Ar-Condicionado" no campo de pesquisa
    Click Element                       ${SEARCH_BAR}
    Input Text                          ${SEARCH_BAR}    Ar-Condicionado

E clica no botão de pesquisa
    Click Element    ${SEARCH_BTN}

Então o sistema deve exibir uma lista de produtos relacionados a "Ar-Condicionado"
    Wait Until Element Is Visible      ${SEARCH_RESULTS_TITLE}      
    Wait Until Element Is Visible      ${SEARCH_RESULTS_COUNTER}    826 
      
    ${PRODUCTS}=    Get WebElements    ${TITLE_CARD}
    FOR    ${PRODUCT}    IN    @{MY_LIST_OF_PRODUCTS}
    ${PRODUCT_NAME}=    Get Text    ${TITLE_CARD}
    Log    ${PRODUCT_NAME}
    END