module Api
  class TodosController < ApiController
    before_action :authenticate_user
    before_action :set_todo, only: [:update]

    def index
      json_response(current_user.todos)
    end

    def create
      @todo = current_user.todos.new(todo_params)
      if @todo.save
        json_response(@todo, :created)
      else
        json_response(@todo)
      end
    end

    def update
      if @todo.update_attributes(todo_params)
        json_response(@todo, :ok)
      else
        json_response(@todo)
      end
    end

    private

    def todo_params
      params.require(:todo).permit(:title, :description)
    end

    def set_todo
      @todo = current_user.todos.find_by(id: params[:id])
    end
  end
end
