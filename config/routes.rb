Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    resources :messages, only: [:new]
  end

  resources :messages, only: [:create, :destroy]

  scope 'messages' do
    get 'received', to: 'messages#receieved'
    get 'sent', to: 'messages#sent'
  end

  resources :interests, only: [:index, :show]
end
