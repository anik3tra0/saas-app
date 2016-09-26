class Account < ActiveRecord::Base
   RESTRICTED_SUBDOMAINS = %w(www).freeze

   belongs_to :owner, class_name: 'User'

   validates :owner, presence: true
   validates :subdomain, presence: true,
                         uniqueness: { case_sensitive: false },
                         format: { with: /\A[\w\-]+\Z/i, message: 'Contains invalid characters' },
                         exclusion: { in: RESTRICTED_SUBDOMAINS, message: 'Restricted' }
   accepts_nested_attributes_for :owner

   before_validation :downcase_subdomain
   after_save :create_cloudflare_subdomain if Rails.env.production?

   private

   def downcase_subdomain
      self.subdomain = subdomain.try(:downcase)
   end

   def create_cloudflare_subdomain
      cf = CloudFlare.connection(Rails.application.secrets.cf_api_key, Rails.application.secrets.cf_reg_email)
      begin
         cf.rec_new(Rails.application.secrets.cf_primary_domain, 'A', subdomain, Rails.application.secrets.cf_ip_address, 1)
      rescue => e
         puts e.message # error message
      else
         puts 'Successfuly added DNS record'
      end
   end
end
