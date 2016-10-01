Rails.application.routes.draw do
  root 'sessions#index'
  
  resources :users
  resources :posts
  resources :likes

  post '/login' => 'sessions#login'
  delete '/logout' => 'sessions#logout'
end
