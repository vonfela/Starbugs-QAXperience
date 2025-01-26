require 'rspec'                                            # temos que importar o rspec pq o expect é do rspec e não do Cucumber nem do Capybara


class Popup
    include Capybara::DSL                                  # assim como temos que importar o Capybara pois estamos usando o find que é do Capybara.
    include RSpec::Matchers

    def have_text(text)
        popup = find('.swal2-html-container')
        expect(popup.text).to eql text
    end



end
