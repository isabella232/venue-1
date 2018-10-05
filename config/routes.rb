Rails.application.routes.draw do 

  namespace :admin do
    get :dashboard, controller: :dashboard, action: :index
    resources :campaigns, only: [:index, :update]
  end
  devise_for :users, controllers: {
    registrations: :registrations,
    omniauth_callbacks: :omniauth_callbacks,
    sessions: :sessions
  }
  root controller: :campaigns, action: :index
  resources :users, only: [:show]
  resources :campaigns, only: [:index, :create, :new, :show, :update, :edit]
  resources :performers, only: [:new, :create, :show, :index, :update, :edit]
  resources :tickets, only: [:create]
  resources :orders, only: [:create]
  resources :payments, only: [:new, :create]
  post '/charges', controller: :purchases, action: :create
end
