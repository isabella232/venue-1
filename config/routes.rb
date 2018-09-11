Rails.application.routes.draw do
  get 'purchase/create'
  get 'purchase/new'
  get 'sessions/new'
  devise_for :users, controllers: {
    registrations: :registrations,
    omniauth_callbacks: :omniauth_callbacks,
    sessions: :sessions
  }
  root controller: :campaigns, action: :index
  resources :campaigns, only: [:index, :create, :new, :show, :update]
  resources :performers, only: [:new, :create, :show]
  resources :tickets, only: [:create]
  resources :orders, only: [:create]
  post '/charges', controller: :purchases, action: :create
end
