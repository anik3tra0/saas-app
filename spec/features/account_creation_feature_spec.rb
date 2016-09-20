require 'rails_helper'
require 'spec_helper'

describe 'account creation' do
   it 'allows user to create account' do
      visit root_path
      click_link 'Create Account'

      fill_in 'Name', with: 'Aniket'
      fill_in 'Email', with: 'aniket@syook.com'
      fill_in 'Password', with: 'Secret@123'
      fill_in 'Password Confirmation', with: 'Secret@123'
      fill_in 'Subdomain', with: 'test-subdomain'
      click_button 'Create account'

      expect(page).to have_content('Signed up successfully')
   end
end
