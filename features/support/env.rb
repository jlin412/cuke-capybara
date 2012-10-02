require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'rspec'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.default_selector = :xpath
Capybara.default_wait_time = 5

module Helpers
  def without_resynchronize
    page.driver.options[:resynchronize] = false
    yield
    page.driver.options[:resynchronize] = true
  end
end

World(Capybara::DSL, Helpers)