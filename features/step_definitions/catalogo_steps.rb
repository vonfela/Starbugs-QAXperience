#### CENÁRIO 1:

Quando('acesso a página principal da Starbugs') do
    @home.open
    #visit 'https://starbugs.vercel.app/'
end
  
Então('eu devo ver uma lista de cafés disponíveis') do
    expect(@home.coffee_list.size).to be > 0
    #products = all('.coffee-item')
    #expect(products.size).to be > 0
end



#### CENÁRIO 2:

Dado('que estou na página principal da Starbugs') do
    @home.open
end

Dado('que desejo comprar o seguinte produto:') do |table|
    @product = table.rows_hash                                            # MÉTODO 3 DE APLICAR: transforma tudo numa variavel global.
    #  puts table.rows_hash                                               # MÉTODO 2 DE APLICAR: rows_hash é uma função do cucumber que converte a tabela em um hash. Linha de hash, dessa forma o cucumber continua convertendo para um objeto nativo do Ruby porém em linhas de chave valor em vez de coluna, fica bem melhor por que é uma única informação.
    # @product_name = table.rows_hash[:product]                           # usamos dessa forma, vem no formato hash, n preciso pegar na posição 0 por que é uma linha mesmo.
    # @product_price = table.rows_hash[:price]                         
    # @delivery_price = table.rows_hash[:delivery]                     
    
    # @product_name = table.hashes[0][:product]                           # MÉTODO 1 DE APLICAR: Conversão de tabela delimitada por pipe para um objeto nativo do ruby para vc ter acesso a cada informação da massa de teste, chamando a FUNÇÃO HASHES,
    # @product_price = table.hashes[0][:price]                            # ainda assim é um ARRAY, um array de hashes em Ruby.
    # @delivery_price = table.hashes[0][:delivery]                        # Usuaríamos dessa forma se tivessemos mais de uma linha de informação.                     
end                                                             

Quando('inicio a compra desse item') do
    @home.buy(@product[:name])
    #product = find('.coffee-item', text: @product[:name])
    #product.find('.buy-coffee').click
end

Então('devo ver a página de Checkout com os detalhes do produto') do
    @checkout.assert_product_details(@product)
    
    #product_title = find('.item-details h1')
    #expect(product_title.text).to eql @product[:name]

    #sub_price = find('.subtotal .sub-price')
    #expect(sub_price.text).to eql @product[:price]

    #delivery_price = find('.delivery-price')
    #expect(delivery_price.text).to eql @product[:delivery]
end

Então('o valor total da compra deve ser de {string}') do |total_price|
    @checkout.assert_total_price(total_price)
    #price = find('.total-price')
    #expect(price.text).to eql total_price
end



# CENÁRIO 3:

Então('devo ver um popup informando que o produto está indisponível') do
    @popup.have_text('Produto indisponível')    
    #popup = find('.swal2-html-container')
    #expect(popup.text).to eql 'Produto indisponível'
  end