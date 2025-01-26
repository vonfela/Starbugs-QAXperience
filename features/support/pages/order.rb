require 'rspec'

class OrderPage                                                                                                         # Essa é a classe que vai ser transformada em variável global representando esse arquivo no hooks.rb
    include Capybara::DSL
    include RSpec::Matchers

    def assert_order                                                                                                    # Aqui não estamos passando argumento pois não há mais de um método ou valor/dado que precisa ser acessado, estamos apenas validadno se estamos na página correta, validando por um texto que contém nela por padrão.
        expect(find('h1').text).to eql  'Uhull! Pedido confirmado'                                                      # Expect é um método do Rspec q usamos para esperar alguma coisa, dentro dele estamos passsando como argumento que é para ele encontrar (find do capybara) e dentro desse encontrar um argumento para ele encontrar pelo elemento h1 e o texto desse h1 que será validado no argumento do expect com o ".to eql" e depois passamos o texto que esperamos que seja validado. Aqui a gente poderia ter criado uma variável para guardar o valor do texto que a gente vai validar mas nem precisa.
        expect(find('p[color=subtitle]').text).to eql 'Agora é só aguardar que logo o café chegará até você'            # Aqui vamos validar o elemento p com a propriedade color que é uma propriedade customizada que não é tão comum HTML, 
    end

    def assert_delivery_time(target)                                                                                    # Aqui estamos criando o método assert_devlivery_time com o argumento target que é referente à massa de teste do arquivo pedido.feature, que é a previsão de entrega.
        delivery_time = find('p', text: 'Previsão de entrega')                                                          # Aqui criamos a variável delivery_time e atribuímos a ela a ação/método find para encontrar primeiro o elemento pai que é o p e que esse elemento p contenha o texto 'Previsão de entrega', e guardamos esse texto na variável devlivery_time que criamos.
        expect(delivery_time.find('strong').text).to eql target                                                         # Aqui estamos validando a variável delivery_time mas fazendo uma validação diferente por que não queremos o valor de p e sim outra coisa que contém nela que é o elemento strong que é um elemento filho do p, então usamos o método find para encontrar o elemento filho strong e pegar o texto dele e validarmos que o texto dele é o nosso target que é o argumento da massa de teste que queremos validar. Precisamos validar dessa forma pois existem dois elementos p nesta página mas para informações diferentes então precisamos fazer esse seletor/validado único.
    end

end