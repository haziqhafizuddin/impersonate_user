require 'rails_helper'

describe Api::UserTokenController, type: :request do
  let(:user) { create :user }

  describe 'POST /user_token' do
    let(:authentication) do
      {
        auth: {
          email: user.email,
          password: user.password
        }
      }
    end

    before { post '/user_token', params: authentication }

    it 'create jwt token' do
      expect(json).to include('jwt')
    end
  end
end
