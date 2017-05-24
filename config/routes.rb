Rails.application.routes.draw do
  resources :scrapers
  root to: "listings#home"
  resources :listings, :phrases
  get '/discriminatory', to: 'listings#discriminatory'
  get '/visualization', to: 'listings#visualization'
  get '/track_changes', to: 'listings#track_changes'
end
