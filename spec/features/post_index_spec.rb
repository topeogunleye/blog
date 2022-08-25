require 'rails_helper'

describe 'index page' do
  before :each do
    @user_first = User.create(name: 'Temitope', photo: 'user.png', bio: 'This is first user')

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
  end

  describe 'check users#index path' do
    it 'Should set the link of the picture to the img src' do
      visit '/'
      all('img').each do |i|
        expect(i[:src]).to eq('assets/images/user.png')
      end
    end
  end

  it 'Should display the user name' do
    visit '/'
    expect(page).to have_content('Temitope')
  end

  it 'Should display the total post number of 3' do
    visit '/'
    expect(page).to have_content('Number of posts: 3')
  end

  it 'Should display post title' do
    visit user_posts_path(@user_first.id)
    expect(page).to have_content('Self Improvement is the goal')
    expect(page).to have_content('Eating Healthy Daily')
    expect(page).to have_content('Exercising Daily')
  end

  it 'Should display some of the post body' do
    visit user_posts_path(@user_first.id)
    expect(page).to have_content('This is my first post')
    expect(page).to have_content('This is my second post')
    expect(page).to have_content('This is my third post')
  end

  it 'Should display the first comment on the post' do
    visit user_posts_path(@user_first.id)
    expect(page).to have_content('My first comment')
  end

  it 'Should display the number of likes on the post' do
    visit user_posts_path(@user_first.id)
    expect(page).to have_content('Likes: 1')
  end

  it 'Should display the number of comments on the post' do
    visit user_posts_path(@user_first.id)
    expect(page).to have_content('Comments: 1')
  end

  it 'should display section for pagination if there are more posts than fit on the view' do
    visit user_posts_path(@user_first.id)
    expect(page).to have_content('Next')
  end

  it "Should navigate to post's show page" do
    visit user_post_path(@user_first.id, @post_first.id)
    expect(page).to have_content('Self Improvement is the goal')
  end
end
