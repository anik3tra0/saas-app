class ApplicationController < ActionController::Base
   # Prevent CSRF attacks by raising an exception.
   # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :exception

   before_action :load_schema

   private

   def load_schema
      Apartment::Database.switch!('public')
      return unless request.subdomain.present?

      Apartment::Database.switch!(request.subdomain)
   end
end
