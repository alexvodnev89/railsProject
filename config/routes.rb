Rails.application.routes.draw do
  

  root 'static_pages#home'
  
  get  '/help',      to: 'static_pages#help'
  get  '/about',     to: 'static_pages#about'
  get  '/contact',   to: 'static_pages#contact'
  get  '/memberpage',to: 'static_pages#membershippage'
  get  '/welcome',   to: 'static_pages#userwelcome'
  get  '/thanks',    to: 'static_pages#thankyoupage'
  get  '/gymclass',  to: 'static_pages#gymclasspage'
  get  '/signup',    to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  

  resources :users
  resources :microposts,          only: [:create, :destroy]
  resources :memberships,          only: [:create, :destroy]
  resources :membership_options
  resources :messages
  resources :gymclasses
  resources :pages
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  get ':title', to: 'pages#show'
end
