FactoryGirl.define do
   factory :account do
      sequence(:subdomain) { |n| "subdomain#{n}" }
      association :owner, factory: :user

      factory :account_with_schema do
         after(:build) do |account|
            Apartment::Tenant.create(account.subdomain)
            Apartment::Tenant.switch!(account.subdomain)
         end
         after(:create) do |_account|
            Apartment::Tenant.reset
         end
      end
   end
end
