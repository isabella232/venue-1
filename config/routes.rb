Rails.application.routes.draw do
  root controller: :application, action: :index
  resources :campaigns, only: [:create, :new]
end
 