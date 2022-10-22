require 'rails_helper'

RSPEC.describe Comment, type: :model do
  before(:all) do
    @user = User.create(name: 'test', photo: 'https://unsplash.com/photos/', bio: 'test')
    @post = Post.create(author_id: @user.id, title: 'test', text: 'test')
  end

  it 'should create a comment' do
    comment = Comment.create(author_id: @user.id, post_id: @post.id, text: 'test')
    expect(comment).to be_valid
  end

  it 'should not create a comment without a text' do	
    comment = Comment.create(author_id: @user.id, post_id: @post.id)
    expect(comment).to_not be_valid
  end

  it 'should not create a comment without an author' do 
    comment = Comment.create(post_id: @post.id, text: 'test')
    expect(comment).to_not be_valid
  end

  it 'should return comments_counter increment atfer saving the post' do  
    comment = Comment.create(author_id: @user.id, post_id: @post.id, text: 'test')
    expect(@post.comments_counter).to eq(1)
  end

end

