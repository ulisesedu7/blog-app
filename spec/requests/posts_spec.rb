require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'When the page is call, expect' do
    it 'returns http success' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
      expect(response.body).to include('posts')
    end
  end

  describe 'When the show pages is called' do
    it 'returns http success' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
      expect(response.body).to include('posts')
    end
  end
end
