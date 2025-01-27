
                                                                # Criar classe em ruby: class "NomeDaClasse" usando o padrão pascal case onde a primeira letra é maiúscula e as palavras seguintes também.
class HomePage                                                  # Essa classe vai representar a página principal e dentro dessa classe poderemos ter propriedades ou funções que vão representar elementos ou fuincionalidades da propria pagina principal que é a homepage
    include Capybara::DSL                                       # Agora essa classe  HomePage vai ter todos os recursos do Capybara pra usar dentro de qualquer método que for implementado, nessa caso o método find por exemplo, que é um método do Capybara.

    def open                                                    # esse metodo tem a responsabilidade de abrir a pagina principal.
        visit 'https://starbugs-qa.vercel.app/'                    # Essa arquiv, a classe HomePage não consegue executar VISIT, que é um método DO CAPYBARA, o visit funciona bem na camada de steps mas não nessa home, pq o arquivo env que é o arquivo principal do cucumbero a gente tem a importação e configuração do Capybara só que o Cucumber naõ sabe que eu estou construindo uma nova camada personalizad, eu tenho que deixar claro que eu quero usar o Capybara dentro dessa classe. classe visit sem o include não consegue executar
    end   
    
    def coffee_list                                                   # esse metodo tem a responsabilidade de retornar todos os cafés disponíveis na página principal.
        return all('.coffee-item')                              # all é um método do Capybara que retorna todos os elementos que tem a classe .coffee-item, que são os cafés disponíveis na página, o return vai buscar todos os elementos q tem a classe coffee-item com esse seletor e vai retornar com esse resultado.
    end

    def buy(coffee_name)                                        # esse metodo tem a responsabilidade de comprar um café específico mas tendo toda a lista de cafés disponíveis. Dentro de parenteses é um argumento, onde eu vou passar o nome do café que eu quero comprar.
        product = find('.coffee-item', text: coffee_name) 
        product.find('.buy-coffee').click
    end
    
end