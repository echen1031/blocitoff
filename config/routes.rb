Blocitoff::Application.routes.draw do

  devise_for :users

  resources :lists 
  resources :list_items
  

  root :to => "home#index"
end
