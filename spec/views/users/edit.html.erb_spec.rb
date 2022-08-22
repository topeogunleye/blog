require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            name: 'MyString',
                            photo: 'MyString',
                            bio: 'MyText',
                            posts_counter: 1
                          ))
  end

  it 'renders the edit user form' do
    render

    assert_select 'form[action=?][method=?]', user_path(@user), 'post' do
      assert_select 'input[name=?]', 'user[name]'

      assert_select 'input[name=?]', 'user[photo]'

      assert_select 'textarea[name=?]', 'user[bio]'

      assert_select 'input[name=?]', 'user[posts_counter]'
    end
  end
end
