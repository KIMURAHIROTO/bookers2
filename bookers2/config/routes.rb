Rails.application.routes.draw do
  devise_for :users
  resources :users
  root to: 'homes#top'
  resources :books
  get 'home/about'=> 'homes#about'
  
end
