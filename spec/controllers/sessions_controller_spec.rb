require 'rails_helper'

RSpec.describe 'Sessions', type: :feature do
  describe 'Logges a user in' do
    user = User.new(username: 'test', password: 'mytest123')
    user.save
    it 'Should login a User' do
      visit login_path
      fill_in 'username', with: 'test'
      fill_in 'password', with: 'mytest123'
      find("input[type='submit']").click
      expect(page).to have_content(/Private Events/)
    end

    it 'will not allow user to login without proper username and password' do
      visit login_path
      fill_in 'username', with: 'myemail'
      fill_in 'password', with: 'main'
      find("input[type='submit']").click
      expect(page).to have_content(%r{Invalid email/password combination})
    end

    it 'It should redirect to sign up page if user click sign up button' do
      visit login_path
      find('.btn-link').click
      expect(page).to have_content(/Sign Up/)
    end
  end
end
