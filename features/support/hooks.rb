

require_relative './pages/home.rb'              # Aqui estamos fazendo uma importação relativa da camada page objects home.rb para dentro esse arquivo hooks.rb
require_relative './pages/checkout.rb'
require_relative './pages/order.rb'
require_relative './pages/components.rb'


Before do
    @home = HomePage.new                        # Aqui estamos instanciando/ativando a classe HomePage da camada page objects home.rb, assim consigo ter acesso a home em qualquer camada de testes. Transformando ela também em uma variável global.
    @checkout = CheckoutPage.new
    @order = OrderPage.new                      # Aqui estamos instanciando/ativando a classe OrderPage que estamos transformando em variável global, basicamente estamos transformando aquele outro arquivo (order.rb da camada de page objects) em uma variável global que vai se chamar @order para ser usada em qualquer outro arquivo de teste, sendo assim possível usar os métodos que estamos criando com os passos do teste de forma modularizada.
    @popup = Popup.new
end

After do |scenario|
    #if (scenario.failed?)                                                                                    # Aqui estamos fazendo a mesma coisa que fizemos nos parametros abaixo de screenshot e attach porém aqui estamos passando o argumento em pipe para o método After, para que possamos validar se o scenario falhou ou não, se não falhar, não será adicionado o screenshot, se falhar, será adicionado o screenshot.
    #    screenshot = page.save_screenshot("reports/screenshots/EvidenciaUltimoTesteReport.png")               # Lembrando que aqui estamos passando um nome fixo para o arquivo png, gerando assim somente 1 arquivo por execução que será sempre o último teste executado. 
    #    attach(screenshot, "image/png", "Screenshot")
    #end

    #screenshot = page.save_screenshot("reports/screenshots/EvidenciaUltimoTesteReport.png")                    # Aqui dizemos para a final de cada teste o cucumber tirar um print da tela ja que o final de cada teste é onde temos o resultado esperado. Então aqui estamos tirando um print da tela, o método save_screenshot é um método do capybara que tira um print da tela, e o parâmetro/argumento que ele recebe é o caminho onde ele vai salvar o print e o nome do arquivo com o seu formato que no caso é png, se passarmos uma string vazia ele vai salvar o print na pasta raiz do projeto, se passarmos um caminho ele vai salvar o print nesse caminho.
    #attach(screenshot, "image/png", "Screenshot") 
    
    screenshot = page.save_screenshot("reports/screenshots/#{scenario.__id__}.png")                            # Aqui em vez de passarmos um nome fixo, podemos adicionar este #{scenario.__id__} o que permitira que seja gravado TODOS OS SCREENSHOTS DE TODOS OS CENARIOS/TESTES com o id da execução dentro do contexto daquela rodada.
    attach(screenshot, "image/png", "Screenshot")
end