require 'rails_helper'

describe Api::AdminTokenController, type: :request do
  let(:admin) { create :admin }

  describe 'POST /admin_token' do
    let(:authentication) do
      {
        auth: {
          email: admin.email,
          password: admin.password
        }
      }
    end

    before { post '/admin_token', params: authentication }

    it 'create jwt token' do
      expect(json).to include('jwt')
    end
  end
end
