require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            name: 'Name',
                            photo: 'Photo',
                            bio: 'MyText',
                            posts_counter: 2
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Photo/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
