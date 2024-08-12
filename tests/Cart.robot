*** Settings ***
Documentation    Essa suíte testa o campo search do site Ferreira Costa
Resource         ../resources/Base.resource
Resource         ../resources/Search.resource
Resource         ../resources/Cart.resource
Test Setup       Start Page
Test Teardown    Close Page

*** Test Cases ***
Caso de Teste 01 - Adicionar produto ao carrinho e validar valor total
    [Documentation]    Este teste tem como objetivo validar a adição de um produto ao carrinho de compras
    ...                e garantir que o valor total do pedido seja atualizado corretamente, refletindo o preço do produto
    [Tags]             add_product    total_value
    Dado que o usuário está na página de detalhes de um produto
    E o carrinho de compras está vazio
    Quando o usuário clica no botão "Adicionar ao Carrinho"
    Então o produto deve ser adicionado ao carrinho
    E o carrinho deve exibir o produto com o valor total correto