Rails.application.routes.draw do

  # main resources
  # --------------------------------------------------------

  # Home pages
  authenticated :user do
    root to: 'users/home#index', as: :authenticated_root
  end
  root "home#index"

  # Authenticated pages
  resources :grades
  resources :dispensed_lectures
  resources :promotions
  resources :dispensed_lecture
  resources :user_promotions
  resources :lectures
  resources :lectures

  # devise routes
  # --------------------------------------------------------
  get '/login', to: 'users/sessions#new'
  post '/login', to: 'users/sessions#create'
  get '/change_password', to: 'users/passwords#edit'
  patch '/change_password', to: 'users/passwords#update'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end


end
