Rails.application.routes.draw do
  get 'welcome/index'
  
  mount API => '/'
  
  resources :members
  
  root 'welcome#index'
end
