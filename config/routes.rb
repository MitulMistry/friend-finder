Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :messages, only: [:new]
  end
  get '/signup', to: 'users#new'

  resources :sessions, only: [:create]
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  resources :messages, only: [:create, :destroy]

  scope 'messages' do
    get 'received', to: 'messages#received'
    get 'sent', to: 'messages#sent'
  end

  resources :interests, only: [:index, :show]

  root 'pages#index'
end
