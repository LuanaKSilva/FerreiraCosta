*** Settings ***
Documentation    Essa suíte testa o campo search do site Ferreira Costa
Resource         ../resources/Base.resource
Resource         ../resources/Search.resource
Resource         ../resources/Cart.resource
Test Setup       Start Page
Test Teardown    Close Page

*** Test Cases ***
Caso de Teste 01 - Pesquisa de produtos por palavra-chave
    [Documentation]    Este teste tem como objetivo validar a funcionalidade do campo de pesquisa de produtos
    ...                assegurando que ele retorne resultados precisos e relevantes com base nos termos inseridos pelo usuário
    [Tags]             search_product
    Dado que o usuário está na página principal do site Ferreira Costa
    E há um campo de pesquisa visível no topo da página
    Quando o usuário digita "Ar-Condicionado" no campo de pesquisa
    E clica no botão de pesquisa
    Então o sistema deve exibir uma lista de produtos relacionados a "Ar-Condicionado"