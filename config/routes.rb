Blocitoff::Application.routes.draw do
  get "home/index"  
  devise_for :users

  resources :lists 

  root :to => "home#index"
end
