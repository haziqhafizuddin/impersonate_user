require 'rails_helper'

describe Api::ImpersonatesController, type: :request do
  let!(:user) { create(:user) }
  let!(:todos) { create_list(:todo, 5, user: user) }
  let!(:admin) { create(:admin) }

  before do
    get "/api/impersonates/#{user.id}",
        headers: authenticated_header(admin)
  end

  it 'GET /api/impersonates/:id' do
    jwt = json['impersonate_jwt']
    token = {
      :"Content-Type" => 'application/json',
      :Authorization => "Bearer #{jwt}"
    }
    get '/api/todos', headers: token
    
    expect(json.first['user_id']).to eq(user.id)
    expect(json.count).to eq(5)
  end
end
