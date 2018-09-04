Rails.application.routes.draw do
  root controller: :campaigns, action: :index
  resources :campaigns, only: [:create, :new]
end
 