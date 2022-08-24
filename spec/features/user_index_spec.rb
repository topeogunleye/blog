require 'rails_helper'

RSpec.describe 'Users pages test', type: :feature do
  describe 'index page' do
    before :each do
      @user_first = User.create(name: 'Temitope', photo: 'user.png', bio: 'A cute baby')
      @user_second = User.create(name: 'Superman', photo: 'user.png', bio: 'A beautiful lady')
      @user_third = User.create(name: 'Roseline', photo: 'user.png', bio: 'A good guy')
    end

    it 'check users#index path' do
      visit '/'
      expect(current_path).to eq(root_path)
      expect(page).to have_text('Number of')
    end

    it 'Should display all user names' do
      visit '/'
      expect(page).to have_content('Temitope')
      expect(page).to have_content('Superman')
      expect(page).to have_content('Roseline')
    end

    it 'Should set the link of the picture to the img src' do
      visit '/'
      all('img').each do |i|
        expect(i[:src]).to eq('assets/images/user.png')
      end
    end

    it 'Should display the total post number of users' do
      visit '/'
      expect(page).to have_content('Number of posts: 0')
    end

    it "Should navigate to user's show page" do
      visit user_path(@user_first.id)
      expect(current_path).to eq(user_path(@user_first.id))
    end
  end
end
