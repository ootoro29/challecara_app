Rails.application.routes.draw do
  resources :messages
  get 'sessions/new'
  get 'users/new'
  root 'top_pages#top'
  get 'home' => 'home_pages#home'
  put 'home' => 'home_pages#update'
  get 'home/:id' => 'home_pages#home'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :users
resources :groups
  #resources :books, param: :group_id
  #scope: 'group' do
    #resources :books
  #end
  resources :groups do
    resources :books do
      resources :q_pages 
      resources :p_pages
    end
  end
  resources :invites, param: :group_id
end
