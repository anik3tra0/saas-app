ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'spec_helper'
require 'database_cleaner'
require 'capybara/rspec'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
   config.include FactoryGirl::Syntax::Methods
   # config.include Devise::TestHelpers, type: :controller
   config.order = 'random'

   config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:transaction)
   end

   config.before(:each) do
      DatabaseCleaner.start
   end

   config.after(:each) do
      DatabaseCleaner.clean
   end
   config.include Rails.application.routes.url_helpers
   config.include Capybara::DSL
end

Shoulda::Matchers.configure do |config|
   config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
   end
end
