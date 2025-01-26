#language: pt

Funcionalidade: Catálogo de cafés
    Como um usuário do site, eu quero ver o catálogo de cafés na página principal   # três chaves: o ator (o usuário define o ator), o que eu quero (que é funcionalidade ver o catálogo)
    para que eu possa escolher e saber mais sobre os produtos disponíveis           # e o para que, que é o valor de negócio que é agregado ao construir essa história


Cenário: 1. Acessar o catálogo de cafés na página principal
    Quando acesso a página principal da Starbugs
    Então eu devo ver uma lista de cafés disponíveis



Cenário: 2. Iniciar a compra de um café
    Dado que estou na página principal da Starbugs
        E que desejo comprar o seguinte produto:
        | name     | Expresso Gelado  |            # como é uma única linha, eu posso implementar de outra forma, usando chave valor
        | price    | R$ 9,99          |            # continua sendo um dataTable porém com um tipo diferente, dataTable de chave e valor.
        | delivery | R$ 10,00         |

       # | product         | price   | delivery |  # essa é uma forma de se trabalhar com massa de teste em várias linhas.
       # | Expresso Gelado | R$ 9,99 | R$ 10,00 |
       # | Expresso Gelado | R$ 9,99 | R$ 10,00 |
       # | Expresso Gelado | R$ 9,99 | R$ 10,00 |

     Quando inicio a compra desse item
     Então devo ver a página de Checkout com os detalhes do produto
        E o valor total da compra deve ser de "R$ 19,99"



Cenário: 3. Café indisponível
    Dado que estou na página principal da Starbugs
        E que desejo comprar o seguinte produto:
        | name     | Expresso Cremoso  |            
    Quando inicio a compra desse item
    Então devo ver um popup informando que o produto está indisponível

