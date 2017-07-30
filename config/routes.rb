Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "home#index"

  resources :users

  # get '/users', to: "users#index"
  get '/users/:id/lock', to: "users#lock"
  get '/users/:id/unlock', to: "users#unlock"
  # get '/users/:id/edit', to: "users#edit"
  # patch '/users/:id', to: "users#update"
  # delete '/users/:id', to: "users#destroy"

end
