Rails.application.routes.draw do

  root to: 'articles#index', page_number: 1
  get 'articles/pages/:page_number', to: 'articles#index'
  
  resources :articles
end
