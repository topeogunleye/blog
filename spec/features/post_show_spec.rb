require 'rails_helper'

describe 'show page' do
  before :each do
    @user_first = User.create(name: 'Temitope', photo: 'user.png', bio: 'A cute baby', email: 'topeogunleye1@gmail.com', password: 'Ygpcznj3BCSt$&bc')

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

    @comment = @user_first.comments.new(post_id: @post_first.id, author_id: @user_first.id, text: 'My first comment')
    @comment.post_id = @post_first.id
    @comment.save

    @like = Like.new(author_id: @user_first.id, post_id: @post_first.id)
    @like.author = @user_first
    @like.post = @post_first
    @like.save

    visit root_path
    fill_in 'Email', with: 'topeogunleye1@gmail.com'
    fill_in 'Password', with: 'Ygpcznj3BCSt$&bc'
    click_button 'Log in'
  end

  describe "display post's title" do
    it 'Should display the post title' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Self Improvement is the goal')
    end

    it 'Should display the post author' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Temitope')
    end

    it 'Should display the number of comments' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Comments: 1')
    end

    it 'Should display the number of likes' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Likes: 1')
    end

    it 'Should display the post body' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('This is my first post')
    end

    it 'Should dispay the username of commenters' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Temitope')
    end

    it 'Should display the comment body' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('My first comment')
    end
  end
end
