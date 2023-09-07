Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'top_pages#top'
  get 'home' => 'home_pages#home'
  get 'home/:id' => 'home_pages#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
  resources :groups
end
