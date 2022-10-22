require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.create(name: 'test', photo: 'https://unsplash.com/photos/', bio: 'test')
    @post = Post.create(author_id: @user.id, title: 'test', text: 'test')
  end

  it 'should create a like' do
    like = Like.create(author_id: @user.id, post_id: @post.id)
    expect(like).to be_valid
  end
end
