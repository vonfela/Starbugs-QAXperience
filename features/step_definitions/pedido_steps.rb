Dado('que iniciei a compra do item {string}') do |product_name|
    @home.buy(product_name)
end

Quando('faço a busca do seguinte CEP: {string}') do |zipcode|
    @checkout.find_zipcode(zipcode)                                                                 # zipcode é o argumento onde ele pega a massa de testes do arquivo pedido.feature, convertendo da linguage Gherkin do Cucumber do arquivo pedido.feature para a linguagem Ruby neste arquivo.

                                                                                                    #ESTA É A FUNCIONALIDADE DE BUSCAR CEP, ENTÃO POSSO CONVERTER ISSO EM PAGE OBJECTS, CRIANDO UMA CLASSE PARA ISSO/MÉTODO NO ARQUIVO checkout.rb JA QUE A FUNCIONALIDADE DE BUSCAR O CEP ESTÁ NA PÁGINA DE CHECKOUT.
    #find('input[name=cep]').set(zipcode)                                                           # 'input[name=cep]' é o localizador do campo do CEP que é do tipo input, o método SET é pra preencher um campo.
    #click_on 'Buscar CEP'                                                                          # click_on é um método do Capybara que clica em um botão, link ou qualquer elemento que tenha um texto. No caso apenas o click_on resolve aqui porque o botão de buscar cep também é do tipo input, reaproveitando o mesmo método anterior e buscando apenas pelo texto do botão.                    
end

Quando('informo os demais dados do endereço:') do |table|                                                                 
    @checkout.fill_address(table.rows_hash)                                        

    #address = table.rows_hash                                                                      # Aqui não será uma variável global, será local mesmo.
    #@checkout.fill_address(address[:number], address[:details])
end

Quando('escolho a forma de pagamento {string}') do |payment_type|
    @checkout.choice_payment_type(payment_type)                                                     # Isso aqui simplesmente é a versão page objects do método aplicado abaixo.
    #find('label div', text: payment_type.upcase).click                                             # esses botões de pagamento são radios buttons estilizados mas na verdade são divs, então usamos o find que vai buscar o elemento label div cujo o texto seja igual a payment_type, lembrando que tem uma pegadinha aqui, o elemento está em caixa alta NO NAVEGADOR mas NA ESTRUTURA HTML NÃO, por conta da estilização em css e o Capybara leva isso em consideração, então para o Capybara o texto final tem que estar em caixa alta como o usu[ario ve no navegador/página, então em vez de mudar na massa de teste o texto para caixa alta ( oq vai funcionar) eu posso usar o método upcase do Ruby que vai transformar o texto em caixa alta, assim o texto da massa de teste pode ser em caixa baixa e o Capybara vai transformar em caixa alta. Mas sempre lembrando que seguindo o padrão vamos transformar isso em page objects, criando um método para isso mesmo que esta aplicação ja seja bem simples e óbvia mas temos que seguir o padrão do projeto.
end

Quando('por fim finalizo a compra') do
    @checkout.submit                                                                                # Isso aqui simplesmente é a versão page objects do método aplicado abaixo.
    #click_on 'Confirmar pedido'                                                                    # Diferente do botão de buscar cep que era do tipo input, este elemento do botão de confirmar pedido é do tipo button, então usamos o click_on direto, no seco, que é um método do Capybara que clica em um botão, link ou qualquer elemento que tenha um texto. Já que este método está olhando por toda a página, ele vai encontrar o botão de "confirmar pedido" pelo texto que é o valor em texto do botão e clicar nele. Mas sempre lembrando que seguindo o padrão vamos transformar isso em page objects, criando um método para isso mesmo que esta aplicação ja seja bem simples e óbvia mas temos que seguir o padrão do projeto.
end

Então('sou redirecionado para a página de confirmação de Pedidos') do
    @order.assert_order
end

Então('deve ser informado um prazo de entrega entre {string}') do |delivery_time|
    @order.assert_delivery_time(delivery_time)                                                      # Aqui chamamos o método assert_delivery_time que criamos validando a variável delivery_time (que também é a referência para a massa de dados) que criamos nesse métodos para guardar o valor do pai e procurarmos subsequentemente pelo valor do filho que é o strong e validarmos se o texto dele é o nosso target que é o argumento da massa de teste que queremos validar.
end