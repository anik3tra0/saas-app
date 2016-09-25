class SubdomainPresent
   def self.matches?(request)
      request.subdomain.present?
   end
end

class SubdomainBlank
   def self.matches?(request)
      request.subdomain.blank?
   end
end

Rails.application.routes.draw do
   default_url_options host: 'example.com'
   constraints(SubdomainPresent) do
      root 'dashboard#index', as: :subdomain_root
      devise_for :users
   end

   constraints(SubdomainBlank) do
      root 'welcome#index'
      resources :accounts, only: [:new, :create]
   end
end
