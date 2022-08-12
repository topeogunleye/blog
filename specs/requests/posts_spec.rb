require 'rails_helper'
require_relative '../../app/controllers/posts_controller'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before(:each) do
      @user = create(:user)
      @post = create(:post, user: @user)
    end

    it 'response status was correct' do
      get posts_index_path
      expect(response).to have_http_status(200)
    end

    it 'correct template was rendered.' do
      get posts_index_path
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text.' do
      get posts_index_path
      expect(response.body).to include('There are no posts yet.')
    end
  end
end
