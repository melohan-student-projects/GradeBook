Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end

  get '/login', to: 'users/sessions#new'
  post '/login', to: 'users/sessions#create'
  get '/change_password', to: 'users/passwords#edit'
  patch '/change_password', to: 'users/passwords#update'

  authenticated :user do
    root to: 'users/home#index', as: :authenticated_root
  end

  root "home#index"
end
