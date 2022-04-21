Rails.application.routes.draw do
  
  devise_for :users, only: []

  scope '/api', defaults: { format: :json } do
    resource :login, only: [:create], controller: :sessions
    resources :alerts
    resources :users
    resources :seconds
    resources :thirds
  end 

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root is needed for heroku
  root 'welcome#index'
end
