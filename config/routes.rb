Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  delete '/users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session_path
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # resources :users
  root to: 'profile#index'
  namespace :backoffice do
    resources :users do
      post :import, on: :collection
    end
  end

  resources :profile, only: %i[index] do
    put :update, on: :collection
    get :edit, on: :collection
  end

  match '*path', to: 'profile#index', via: :all
end
