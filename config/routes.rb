Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: 'auth'
  
  scope '/api' do
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
