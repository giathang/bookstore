Rails.application.routes.draw do
  root to: 'books#index'
  resources :books do
    resources :comments
  end
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :books do
        resources :comments
      end
    end
  end
end
