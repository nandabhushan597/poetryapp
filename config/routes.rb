Rails.application.routes.draw do 
  root 'home#index'
  get 'home' => 'home#index'  
  devise_for :users     
  resources :users, only: [:show] do 
  	resources :events, only: [:index, :show, :create, :destroy]   
end 
get 'search' => 'events#search'

get 'details' => 'events#details'
end 


  
