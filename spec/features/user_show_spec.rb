require 'rails_helper'

describe 'show page' do
  before :each do
    @user_first = User.create(name: 'Temitope', photo: 'user.png', bio: 'This is first user',
                              email: 'topeogunleye1@gmail.com', password: 'Ygpcznj3BCSt$&bc')

    @post_first = @user_first.posts.new(title: 'Self Improvement is the goal', text: 'This is my first post')
    @post_first.likes_counter = 0
    @post_first.comments_counter = 0
    @post_first.save

    @post_second = @user_first.posts.new(title: 'Eating Healthy Daily', text: 'This is my second post')
    @post_second.likes_counter = 0
    @post_second.comments_counter = 0
    @post_second.save

    @post_third = @user_first.posts.new(title: 'Exercising Daily', text: 'This is my third post')
    @post_third.likes_counter = 0
    @post_third.comments_counter = 0
    @post_third.save

    visit root_path
    fill_in 'Email', with: 'topeogunleye1@gmail.com'
    fill_in 'Password', with: 'Ygpcznj3BCSt$&bc'
    click_button 'Log in'
  end

  it 'check users#show path' do
    visit user_path(@user_first.id)
    expect(current_path).to eq(user_path(@user_first.id))
    expect(page).to have_text('Eating Healthy Daily')
  end

  it 'Should set the link of the picture to the img src' do
    visit user_path(@user_first.id)
    all('img').each do |i|
      expect(i[:src]).to eq('assets/images/user.png')
    end
  end

  it 'Should display the user name' do
    visit user_path(@user_first.id)
    expect(page).to have_content('Temitope')
  end

  it 'Should display the total post number of 3' do
    visit user_path(@user_first.id)
    expect(page).to have_content('Number of posts: 3')
  end

  it 'Should display user bio' do
    visit user_path(@user_first.id)
    expect(page).to have_content('This is first user')
  end

  it 'Should display the user first 3 posts' do
    visit user_path(@user_first.id)
    expect(page).to have_content('This is my first post')
    expect(page).to have_content('This is my second post')
    expect(page).to have_content('This is my third post')
  end

  it 'Should display a button with "See all posts" text' do
    visit user_path(@user_first.id)
    expect(page).to have_link('See all posts')
  end

  it 'Should redirect to post page after clicking on "See all posts"' do
    visit user_path(@user_first.id)
    click_link 'See all posts'
    expect(current_path).to eq(user_posts_path(@user_first.id))
  end
end
