require 'rspec'                                                     # temos que importar o rspec pq o expect é do rspec e não do Cucumber nem do Capybara


class CheckoutPage
    include Capybara::DSL                                           # assim como temos que importar o Capybara pois estamos usando o find que é do Capybara.
    include RSpec::Matchers

    def assert_product_details(product)                             # método, com argumento product que é a table da massa de dados/teste no catalogo.feature, validando os detalhes do produto na página de checkout.
        product_title = find('.item-details h1')
        expect(product_title.text).to eql product[:name]

        sub_price = find('.subtotal .sub-price')
        expect(sub_price.text).to eql product[:price]

        delivery_price = find('.delivery-price')
        expect(delivery_price.text).to eql product[:delivery]
    end

    def assert_total_price(total_price)                             # método, com argumento value que é o valor total da compra na massa de dados/teste no catalogo.feature, validando o valor total da compra na página de checkout.
        price = find('.total-price')
        expect(price.text).to eql total_price
    end

    def find_zipcode(zipcode)
        find('input[name=cep]').set(zipcode)                        # 'input[name=cep]' é o localizador do campo do CEP que é do tipo input, o método SET é pra preencher um campo.
        click_on 'Buscar CEP'                                       # click_on é um método do Capybara que clica em um botão, link ou qualquer elemento que tenha um texto. No caso apenas o click_on resolve aqui porque o botão de buscar cep também é do tipo input, reaproveitando o mesmo método anterior e buscando apenas pelo texto do botão.                    
    end

    def fill_address(address)                                       # Método fill_address criado, tenho duas possibilidades de argumentos, primeira: passando os argumentos number e details, ou seja, é um método que vai preencher tanto o número quando o complemento do endereço, lembrando que a identificação/seleção do campo no código HTML é COMPLEMENT mas no argumento passamos como DETAILS que é para pegar a informação da massa de teste do arquivo pedido.feature. Ou a outra opção que é passar um argumento só que é o address (recebendo um único objeto) e resolvo a identificação deles nos finds number e complement.
        find('input[name=number]').set(address[:number])            # number é o argumento que é a chave do hash da massa de teste do arquivo pedido.feature, que é o número do endereço.
        find('input[name=complement]').set(address[:details])       # details é o argumento que é a chave do hash da massa de teste do arquivo pedido.feature, que é o complemento do endereço.

        #find('input[name=number]').set(number)
        #find('input[name=complement]').set(details)
    end

    def choice_payment_type(payment_type)                           # Método de escolha de pagamento.
        find('label div', text: payment_type.upcase).click          # esses botões de pagamento são radios buttons estilizados mas na verdade são divs, então usamos o find que vai buscar o elemento label div cujo o texto seja igual a payment_type, lembrando que tem uma pegadinha aqui, o elemento está em caixa alta NO NAVEGADOR mas NA ESTRUTURA HTML NÃO, por conta da estilização em css e o Capybara leva isso em consideração, então para o Capybara o texto final tem que estar em caixa alta como o usu[ario ve no navegador/página, então em vez de mudar na massa de teste o texto para caixa alta ( oq vai funcionar) eu posso usar o método upcase do Ruby que vai transformar o texto em caixa alta, assim o texto da massa de teste pode ser em caixa baixa e o Capybara vai transformar em caixa alta. Mas sempre lembrando que seguindo o padrão vamos transformar isso em page objects, criando um método para isso mesmo que esta aplicação ja seja bem simples e óbvia mas temos que seguir o padrão do projeto.')
    end

    def submit                                                      # Método para clicar no botão de confirmar pedido na página de checkout.
        click_on 'Confirmar pedido'                                 # Diferente do botão de buscar cep que era do tipo input, este elemento do botão de confirmar pedido é do tipo button, então usamos o click_on direto, no seco, que é um método do Capybara que clica em um botão, link ou qualquer elemento que tenha um texto. Já que este método está olhando por toda a página, ele vai encontrar o botão de "confirmar pedido" pelo texto que é o valor em texto do botão e clicar nele. Mas sempre lembrando que seguindo o padrão vamos transformar isso em page objects, criando um método para isso mesmo que esta aplicação ja seja bem simples e óbvia mas temos que seguir o padrão do projeto.
    end

end
