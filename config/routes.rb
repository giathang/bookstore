Rails.application.routes.draw do
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
      resources :authors
    end
  end
end
