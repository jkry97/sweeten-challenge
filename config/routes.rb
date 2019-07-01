Rails.application.routes.draw do

  root 'home_owners#index'
  resources :contracts, except: :update
  resources :contractors
  resources :home_owners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
