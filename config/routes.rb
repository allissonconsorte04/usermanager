Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources :users
  root to: 'profile#index'
  namespace :backoffice do
    resources :users
  end

  resources :profile, only: %i[index] do
    put :update, on: :collection
    get :edit, on: :collection
  end
end
