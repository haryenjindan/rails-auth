Rails.application.routes.draw do

  root to: 'users#home'
  
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

end
