Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: :registrations
  }
  root controller: :campaigns, action: :index
  resources :campaigns, only: [:index, :create, :new]
end
