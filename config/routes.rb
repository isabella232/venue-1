Rails.application.routes.draw do
  get 'sessions/new'
  devise_for :users, controllers: {
    registrations: :registrations,
    omniauth_callbacks: :omniauth_callbacks,
    sessions: :sessions
  }
  root controller: :campaigns, action: :index
  resources :campaigns, only: [:index, :create, :new, :show, :update]
  post :admin_accept, controller: :campaigns, action: :admin_accepts_campaign
  resources :performers, only: [:new, :create, :show]
end
