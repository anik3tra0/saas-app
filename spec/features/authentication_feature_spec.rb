require 'rails_helper'
require 'spec_helper'

RSpec.describe 'user authentication' do
   it 'allows signin with valid credentials' do
      sign_user_in(create(:user))
      expect(page).to have_content('Signed in successfully')
   end

   it 'does not allows signin with invalid credentials' do
      sign_user_in(create(:user), password: 'wrong_password')
      expect(page).to have_content('Invalid Email or password')
   end

   it 'allows user to signout' do
      sign_user_in(create(:user))

      visit root_path
      click_link 'Sign out'
      expect(page).to have_content('Signed out successfully')
   end
end

def sign_user_in(user, opts = {})
   visit new_user_session_path
   fill_in 'Email', with: user.email
   fill_in 'Password', with: (opts[:password] || user.password)
   click_button 'Log in'
end
