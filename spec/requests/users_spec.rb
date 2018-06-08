require 'rails_helper'

describe Api::UsersController, type: :request do
  let(:user) { build_stubbed :user }

  describe 'POST /api/users' do
    let(:user_params) do
      {
        user: {
          email: user.email,
          password: user.password,
          password_confirmation: user.password
        }
      }
    end

    before { post '/api/users', params: user_params }

    it 'create a user' do
      expect(json['email']).to eq(user.email)
    end
  end
end
