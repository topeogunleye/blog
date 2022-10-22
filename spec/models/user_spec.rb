require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(name: 'test', photo: 'https://unsplash.com/photos/', bio: 'test')
  end

  it 'should create a user' do
    expect(@user).to be_valid
  end
end
