Rails.application.routes.draw do
  resources :articles
  # resource :admin do 
  #   get :articles ,on: :collection 
  # end 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
