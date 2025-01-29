Dado('que iniciei a compra do item:') do |table|
    @product = table.rows_hash

    @home.open
    @home.buy(@product[:name])
end

Quando('aplico o seguinte cupom: {string}') do |coupon_code| 
    @checkout.set_discount(coupon_code)
    #find('input[placeholder="Código do cupom"]').set(coupon_code)                   # encontrando o campo do cupon e setando o valor do cupom
    #click_on 'Aplicar'                                                              # Aqui, para clicarmos no botão de aplicar cupom, basta passarmos o click_on com o valor do texto que a gente quer achar/clicar porque esse elemento do botão é um input do tipo botão e o VALUE dele é 'Aplicar', e o método click_on passado no seco assim vai procurar por toda a página que tenha o valor 'Aplicar' e vai clicar no primeiro que encontrar, nesse caso temos a "sorte" de ser o único elemento da pagina com esse valor.
end

Então('o valor final da compra deve ser atualizado para {string}') do |final_price|
    @checkout.assert_total_price(final_price)

end


Então('devo ver a notificação {string}') do |notice|
    @checkout.assert_notice(notice)
end


Então('o valor final da compra deve permanecer o mesmo') do
    @checkout.assert_total_price(@product[:total])                                  # Aqui estamos reaproveitando o metodo product que temos no primeiro passo desse arquivo, que referencia a table da massa de testes, então no primeiro passo eu selecionei o produto pelo nome, aqui eu estou pegando o valor total do produto.
end