Rails.application.routes.draw do
  resources :listings
  get '/discriminatory', to: 'listings#discriminatory'
  root to: "listings#home"
  get '/visualization', to: 'listings#visualization'
  # get 'listings/show'
  # get 'listings/edit'
  # get 'listings/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
