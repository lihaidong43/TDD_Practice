require 'rubygems'
require 'spork'


Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'selenium-webdriver'
  require 'database_cleaner'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}


  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

  Capybara.javascript_driver = :chrome

  RSpec.configure do |config|
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.include FactoryGirl::Syntax::Methods
    config.include LoginMacros
    #config.filter_run :focus => true
    config.use_transactional_fixtures = false
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"
    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
    end

    config.before(:each){
      DatabaseCleaner.start
    }
    config.after(:each){ DatabaseCleaner.clean }
  end

  Spork.each_run do
    Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
    FactoryGirl.factories.clear
    FactoryGirl.reload
  end

end


