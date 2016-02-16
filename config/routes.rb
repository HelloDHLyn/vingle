Rails.application.routes.draw do
  mount API => '/'
  
  root  'welcome#index'

  get   'signup' => 'members#new'
  post  'signup' => 'members#create'
  get   'login' => 'members#login'
  post  'login' => 'members#checkout'

  get   'board' => 'board#view'
  get   'board/write' => 'board#write'
  post  'board/write' => 'board#create'
  get   'board/:id' => 'board#detail'
  post  'board/comment' => 'board#comment'
end
