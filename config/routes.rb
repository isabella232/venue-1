Rails.application.routes.draw do
  get 'campaigns/index'
  root controller: :application, action: :index
end
