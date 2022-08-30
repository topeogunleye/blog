require 'rails_helper'

RSpec.describe 'Users pages test', type: :feature do
  describe 'index page' do
    before :each do
      @user_first = User.create(name: 'Temitope', photo: 'user.png', bio: 'A cute baby',
                                email: 'topeogunleye1@gmail.com', password: 'Ygpcznj3BCSt$&bc')
      @user_second = User.create(name: 'Superman', photo: 'user.png', bio: 'A beautiful lady',
                                 email: 'example@email.com', password: 'thomas123')
      @user_third = User.create(name: 'Roseline', photo: 'user.png', bio: 'A good guy', email: 'tofu@gmailcom',
                                password: 'tytyyt')

      @user_first.save
      @user_second.save
      @user_third.save

      visit root_path
      fill_in 'Email', with: 'topeogunleye1@gmail.com'
      fill_in 'Password', with: 'Ygpcznj3BCSt$&bc'
      click_button 'Log in'
    end

    after(:each) do
      User.destroy_all
    end

    it 'check users#index path' do
      expect(current_path).to eq(root_path)
      expect(page).to have_text('Temitope')
    end

    it 'Should display all user names' do
      expect(page).to have_content('Temitope')
      expect(page).to have_content('Superman')
      expect(page).to have_content('Roseline')
    end

    it 'Should set the link of the picture to the img src' do
      all('img').each do |i|
        expect(i[:src]).to eq('assets/images/user.png')
      end
    end

    it 'Should display the total post number of users' do
      all(:css, '.number_posts').each do |post|
        expect(post).to have_content('Number of posts:')
      end
    end

    it "Should navigate to user's show page" do
      visit user_path(@user_first.id)
      expect(current_path).to eq(user_path(@user_first.id))
    end
  end
end
