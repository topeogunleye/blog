require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.create(name: 'test', photo: 'https://unsplash.com/photos/', bio: 'test')
    @post = Post.create(author_id: @user.id, title: 'test', text: 'test', user_id: @user.id)
  end

  it 'should create a comment' do
    comment = Comment.create(author_id: @user.id, post_id: @post.id, text: 'test', user_id: @user.id)
    expect(comment).to be_valid
  end

  it 'should not create a comment without an author' do
    comment = Comment.create(post_id: @post.id, text: 'test')
    expect(comment).to_not be_valid
  end
end
