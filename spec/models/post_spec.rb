require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(name: 'test', photo: 'https://unsplash.com/photos/', bio: 'test')
  end

  it 'should create a post' do
    post = Post.create(author_id: @user.id, title: 'test', text: 'test', user_id: @user.id)
    expect(post).to be_valid
  end

  it 'should not create a post without a title' do
    post = Post.create(author_id: @user.id, text: 'test', user_id: @user.id)
    expect(post).to_not be_valid
  end

  it 'should not create a post without an author' do
    post = Post.create(title: 'test', text: 'test', user_id: @user.id)
    expect(post).to_not be_valid
  end

  it 'title should not exceed 250 characters' do
    post = Post.create(author_id: @user.id, title: 'a' * 251, text: 'test', user_id: @user.id)
    expect(post).to_not be_valid
  end
end
