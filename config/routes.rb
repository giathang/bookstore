Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :books do
    resources :comments
  end
  resources :authors
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :books do
        resources :comments
      end
      post 'auth_user' => 'authentication#authenticate_user'
      resources :authors
    end
  end
end
