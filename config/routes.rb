Rails.application.routes.draw do
  get 'sessions/new'
  devise_for :users, controllers: {
    registrations: :registrations,
    sessions: :sessions
  }
  root controller: :campaigns, action: :index
  resources :campaigns, only: [:index, :create, :new, :show]
  resources :performers, only: [:new, :create, :update, :show]
end
