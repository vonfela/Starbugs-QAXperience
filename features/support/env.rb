require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.configure do |config|
    config.default_driver = :selenium
    config.default_max_wait_time = 5
end

# Se os warnings de deprecate forem gerados pelo Selenium::WebDriver.logger, o método mais seguro é configurar o nível do logger como mencionado antes:
Selenium::WebDriver.logger.level = :error # APENAS ERROS CRÍTICOS SERÃO EXIBIDOS.