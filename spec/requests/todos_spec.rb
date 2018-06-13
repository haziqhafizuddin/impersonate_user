require 'rails_helper'

describe Api::TodosController, type: :request do
  let!(:user) { create :user }

  describe 'GET /api/todos' do
    let!(:todo) { create(:todo, user: user) }
    before(:each) do
      get '/api/todos', headers: authenticated_header(user), as: :json
    end

    it 'should able to view all todos list' do
      expect(json.first).to eq(JSON.parse(todo.to_json))
    end
  end

  describe 'POST /api/todos' do
    let(:todo) { build_stubbed :todo }
    let(:todo_params) do
      {
        todo: {
          title: todo.title,
          description: todo.description
        }
      }
    end
    before(:each) do
      post '/api/todos', headers: authenticated_header(user),
                         params: todo_params,
                         as: :json
    end

    it 'should successfully created' do
      expect(json['user_id']).to eq(user.id)
      expect(status).to eq(201)
    end
  end

  describe 'PUT /api/todos/:id' do
    let!(:todo) { create(:todo, user: user) }
    let(:todo_edit_params) do
      {
        todo: {
          title: 'new title'
        }
      }
    end

    before(:each) do
      put "/api/todos/#{todo.id}", headers: authenticated_header(user),
                                   params: todo_edit_params,
                                   as: :json
    end

    it 'should successfully updated' do
      expect(json['title']).to eq('new title')
      expect(status).to eq(200)
    end
  end
end
