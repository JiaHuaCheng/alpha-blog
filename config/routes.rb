Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  # get all routes for articles
  # only use routes in []
  # provide restful routes to rails resources
  # rest: mapping HTTP verbs (get, post, put/patch, delete) to CRUD actions.
end
