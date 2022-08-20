require 'rails_helper'
require_relative '../../app/controllers/posts_controller'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before(:each) do
      get '/users/1/posts'
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'should have the correct placeholder text' do
      expect(response.body).to include('This is posts index page ')
    end

    it 'should have a correct response status' do
      expect(response).to have_http_status(:ok)
    end
  end
end
