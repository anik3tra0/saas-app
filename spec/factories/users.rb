FactoryGirl.define do
   factory :user do
      name 'Aniket'
      sequence(:email) { |n| "email#{n}@gmail.com" }
      password 'Secret@123'
   end
end
