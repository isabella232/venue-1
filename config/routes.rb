Rails.application.routes.draw do
  root controller: :campaigns, action: :index
  resources :campaigns, only: [:index, :create, :new, :show]
end