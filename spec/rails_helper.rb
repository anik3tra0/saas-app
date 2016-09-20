ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
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
end
