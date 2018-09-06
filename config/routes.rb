Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: :registrations,
    :omniauth_callbacks: :omniauth_callbacks
  }
  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  root controller: :campaigns, action: :index
  resources :campaigns, only: [:index, :create, :new, :show]
end
