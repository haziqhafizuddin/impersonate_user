require 'rails_helper'

describe Api::UsersController, type: :request do
  let!(:users) { create_list(:user, 5) }
  let!(:admin) { create(:admin) }

  describe 'GET /api/users' do
    before { get '/api/users', headers: authenticated_header(admin) }

    it 'create a user' do
      expect(json.count).to eq(5)
      expect(status).to eq(200)
    end
  end
end
