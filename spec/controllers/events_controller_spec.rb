require 'rails_helper'

RSpec.describe 'Events', type: :feature do
  describe 'Creates an event' do
    user = User.new(username: 'test', password: '123')
    user.save
    it 'will create an event' do
      visit login_path
      fill_in 'username', with: 'test'
      fill_in 'password', with: '123'
      find("input[type='submit']").click
      visit new_event_path
      fill_in 'event_title', with: 'test title'
      fill_in 'event_description', with: 'test desc'
      fill_in 'event_date', with: Time.now
      find("input[type='submit']").click
      expect(page).to have_content(/Events you created/)
    end
  end

  describe 'Creates an event' do
    user = User.new(username: 'test', password: '123')
    user.save
    it 'Should show an error if any field is missing' do
      visit login_path
      fill_in 'username', with: 'test'
      fill_in 'password', with: '123'
      find("input[type='submit']").click
      click_link 'Create Event'
      fill_in 'event_description', with: 'test desc'
      fill_in 'event_date', with: Time.now
      find("input[type='submit']").click
      expect(page).to have_content(/Title can't be blank/)
    end
  end

  describe 'Shows user events' do
    user = User.new(username: 'test', password: '123')
    user.save
    it 'Should show an error if any field is missing' do
      visit login_path
      fill_in 'username', with: 'test'
      fill_in 'password', with: '123'
      find("input[type='submit']").click
      sleep(2)
      click_link 'Logout'
      sleep(2)
      expect(page).to have_content(/You logged out/)
    end
  end
end
