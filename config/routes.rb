Rails.application.routes.draw do
  resources :scrapers
  root to: "listings#home"
  resources :listings, :phrases
  get '/discriminatory', to: 'listings#discriminatory'
  get '/visualization', to: 'listings#visualization'
  get '/tools/stats', to: 'stats#get_stats'
  namespace :tools do
    resources :track_changes
  end
end
