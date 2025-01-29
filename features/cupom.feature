#language:pt

Funcionalidade: Uso de Cupons no Checkout

    Como um usuário da Starbugs, eu quero poder aplicar cupons de desconto na página de checkout
    Para que eu possa obter reduções no preço de produtos, aumentando a satisfação com a minha experiência de compra.

# Neste caso do cupom, os três cenários usam o mesmo contexto que seria o DADO, então neste caso podemos trabalhar de outra forma deixando apenas os QUANDO e ENTÃO os cenários e centralizando o DADO num contexto inicial. 
    Contexto:
        Dado que iniciei a compra do item:
        | name      | Café com Leite |
        | price     | R$ 19,99       |
        | delivery  | R$ 10,00       |
        | total     | R$ 29,99       |

    Cenario: Aplicar Desconto de 20%

    #Dado que iniciei a compra do item:
    #    | name      | Café com Leite |
    #    | price     | R$ 19,99       |
    #    | delivery  | R$ 10,00       |
    #    | total     | R$ 29,99       |
    Quando aplico o seguinte cupom: "MEUCAFE"
    Então o valor final da compra deve ser atualizado para "R$ 25,99"

    #Dado que estou na página de Checkout                                                               # Esta é a forma como especificamos andes da funcionalidade ser desenvolvida para melhor compreensão do dev, depois de pronta, podemos alterar essa especificação pra uma forma mais tecnica para ficar melhor de automatizar, neste caso, escrevendo dessa forma é possível automatizar sim, porém teríamos que automatizar pelo menos 8 métodos, remodelando a especificação agora, temos essa mesma especificaçao porém em 3 métodos, o que facilita a automação. Além de ficar mais profissional.
    #    E o item que está no meu carrinho é o Café com Leite no valor de R$ 19,99
    #    E que a taxa de entrega é de R$ 10,00
    #    E o valor total é de R$ 29,99
    #    E tenho um cupom com 20% de desconto "MEUCAFE"
    #Quando aplico esse cupom de desconto
    #Então o desconto de 20% deve ser aplicado apenas no valor do Café com Leite
    #    E o valor final da compra deve ser atualizado para R$ 25,99

    
    Cenario: Cupom Expirado

    #Dado que iniciei a compra do item:
    #    | name      | Café com Leite |
    #    | price     | R$ 19,99       |
    #    | delivery  | R$ 10,00       |
    #    | total     | R$ 29,99       |
    Quando aplico o seguinte cupom: "PROMO20"
    Então devo ver a notificação "Cupom expirado!"
        E o valor final da compra deve permanecer o mesmo

    #Dado que estou na página de Checkout
    #    E o item que está no meu carrinho é o Café com Leite no valor de R$ 19,99
    #    E que a taxa de entrega é de R$ 10,00
    #    E o valor total é de R$ 29,99
    #   E tenho um cupom que está expirado "PROMO20"
    #Quando aplicao esse cupom de desconto
    #Então devo ver a seguinte notificação "Cupom expirado!"
    #    E o valor final deve permanecer o mesmo

    
    Cenario: Cupom Inválido

    #Dado que iniciei a compra do item:
    #    | name      | Café com Leite |
    #    | price     | R$ 19,99       |
    #    | delivery  | R$ 10,00       |
    #    | total     | R$ 29,99       |
    Quando aplico o seguinte cupom: "PROMO100"
    Então devo ver a notificação "Cupom inválido!"
        E o valor final da compra deve permanecer o mesmo

    #Dado que estou na página de Checkout
    #    E o item que está no meu carrinho é o Café com Leite no valor de R$ 19,99
    #    E que a taxa de entrega é de R$ 10,00
    #    E o valor total é de R$ 29,99
    #    E tenho um cupom com o código inválido "PROMO100"
    #Quando aplicao esse cupom de desconto
    #Então devo ver a seguinte notificação "Cupom inválido!"
    #    E o valor final deve permanecer o mesmo