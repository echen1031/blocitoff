Blocitoff::Application.routes.draw do

  devise_for :users
  devise_scope :users do
    get '/logout' => 'devise/sessions#destroy'
    get '/login' => 'devise/sessions#new'
    get '/signout' => 'devise/sessions#destroy'
    get '/signin' => 'devise/sessions#new'
    get '/register/' => 'users/registrations#new'
  end

  resources :lists 
  resources :list_items
  

  root :to => "home#index"
end
