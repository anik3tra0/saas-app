require 'rails_helper'
require 'spec_helper'

RSpec.describe 'account creation' do
   it 'allows user to create account' do
      visit root_path
      click_link 'Create Account'

      fill_in 'Name', with: 'Aniket'
      fill_in 'Email', with: 'aniket@syook.com'
      fill_in 'Password', with: 'Secret@123'
      fill_in 'Password confirmation', with: 'Secret@123'
      fill_in 'Subdomain', with: 'aniket'
      click_button 'Create Account'

      expect(page).to have_content('Signed up successfully')
   end
end
