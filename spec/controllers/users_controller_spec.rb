require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'Creating a new user' do
    it 'Should be able to create a new User' do
      visit new_user_path
      fill_in 'user[username]', with: 'Test'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      find("input[type='submit']").click
      expect(page).to have_content(/Private Events/)
    end
  end
end
