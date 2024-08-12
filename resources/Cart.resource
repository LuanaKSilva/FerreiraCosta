*** Settings ***
Library     SeleniumLibrary
Resource    Search.resource

*** Variables ***
${ADD_CART}              xpath=//button[contains(@class,'styles__Button-sc-67c75dfb-1 GgCvh add-to-cart')]
${BOX_DETAILS_INFO}      xpath=//section[@data-cy='box-details-info'][contains(.,'')]
${BOX_EMPTY_TXT}         xpath=//div[@data-cy='box-empty'][contains(.,'Seu carrinho está vazio')]
${CART_BTN}              xpath=//span[contains(@data-cy,'cart-hyper-link')]
${CART_ITENS_COUNTER}    xpath=//h2[@data-cy='quantity-items-cart'][contains(.,'1 item')]
${CART_URL}              https://www.ferreiracosta.com/checkout/meu-carrinho
${CLOSE_MODAL}           xpath=//div[contains(@data-cy,'close-button')]
${PRODUCT_CARD}          xpath=//a[@target='_self'][contains(.,'Ar-Condicionado')]
${PRODUCT_TITLE}         xpath=//h3[@data-cy='title-product-card-container'][contains(.,'Ar-Condicionado')]

### Indíce da lista             0        1        2
@{MY_LIST_OF_DETAILS_INFO}    Total    1 item    R$ 2.289,41 à vista

*** Keywords ***
Dado que o usuário está na página de detalhes de um produto
    Dado que o usuário está na página principal do site Ferreira Costa
    E há um campo de pesquisa visível no topo da página
    Quando o usuário digita "Ar-Condicionado" no campo de pesquisa
    E clica no botão de pesquisa
    Wait Until Element Is Visible      ${SEARCH_RESULTS_TITLE}      
    Click Element                      ${PRODUCT_CARD} 

E o carrinho de compras está vazio
    Click Element                    ${CART_BTN}
    Wait Until Element Is Visible    ${BOX_EMPTY_TXT}
    Click Element                    ${CLOSE_MODAL}    

Quando o usuário clica no botão "Adicionar ao Carrinho"
    Click Button    ${ADD_CART}

Então o produto deve ser adicionado ao carrinho
    Wait Until Element Is Visible    ${CART_ITENS_COUNTER}    
    Location Should Be               ${CART_URL}

E o carrinho deve exibir o produto com o valor total correto
    Wait Until Element Is Visible    ${PRODUCT_TITLE}    

    ${DETAILS}=    Get WebElements    ${BOX_DETAILS_INFO}
    FOR    ${INFOS}    IN    @{MY_LIST_OF_DETAILS_INFO}
    ${TEXT}=    Get Text    ${BOX_DETAILS_INFO}
    Log    ${TEXT}
    END