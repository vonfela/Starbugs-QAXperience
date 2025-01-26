

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