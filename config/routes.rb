Rails.application.routes.draw do
  root to: 'listings#index'
  resources :listings, :phrases
  get '/discriminatory', to: 'listings#discriminatory'
  get '/check_listings', to: 'listings#check_listings'
  # get 'listings/show'
  # get 'listings/edit'
  # get 'listings/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
