Rails.application.routes.draw do
  
  devise_for :users
  resources :posts
  resources :projects
  resources :contacts, only: [:new, :create]
  get 'welcome/index'
  root 'welcome#index'
  
  get '*path' => redirect('/') #Any routing error is automatically redirected to the root path
end
