Rails.application.routes.draw do
  root to: 'chats#index'

  resources :chats, only: [:index, :show, :new, :create] do
    resources :messages, only: [:create]
  end

  get '/api/chats', to: 'chats#api_index'
  post '/api/messages', to: 'messages#api_create'
end
