Rails.application.routes.draw do
  root to: "listings#home"

  
  resources :listings, :phrases
  get '/discriminatory', to: 'listings#discriminatory'
  get '/visualization', to: 'listings#visualization'
  # get 'listings/show'
  # get 'listings/edit'
  # get 'listings/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
