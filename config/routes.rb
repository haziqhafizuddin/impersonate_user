Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :users, only: %i[create]
    resources :todos
  end
end
