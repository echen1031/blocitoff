Blocitoff::Application.routes.draw do
  
  devise_for :users
  resources :lists
    resources :items

  root :to => "home#index"
end
