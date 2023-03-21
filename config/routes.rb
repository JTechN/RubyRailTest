Rails.application.routes.draw do
  devise_for :users

  # devise_for :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'pages#home'

  #account registration for accounts

  devise_for :accounts


  namespace :admin do
    resources :accounts do
      member do
        put :activate
        put :deactivate # Add this line for the deactivate action
      end
    end
  end


end
