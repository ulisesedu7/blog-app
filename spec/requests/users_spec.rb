require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'When the users page is called' do
    it 'returns http success' do
      get '/users'
      expect(response).to render_template(:index)
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Welcome to the Users Page')
    end
  end

  describe 'When the show pages is called' do
    it 'returns http success' do
      get '/users/1'
      expect(response).to render_template(:show)
      expect(response.status).to eq(200)
      expect(response).to have_http_status(:success)
      expect(response.body).to include('User')
    end
  end
end
