Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  root controller: :application, action: :index
end
=======
  root controller: :campaigns, action: :index
  resources :campaigns, only: [:index, :create, :new]
end
>>>>>>> cfaf6def2f88f72b6a077f569fd10b7ff6d04a18
