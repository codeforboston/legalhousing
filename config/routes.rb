Rails.application.routes.draw do
  resources :scrapers
  root to: "listings#home"
  resources :listings, :phrases
  get '/discriminatory', to: 'listings#discriminatory'
  get '/visualization', to: 'listings#visualization'
  post '/tools/stats', to: 'stats#get_stats'
  get '/tools/stats', to: 'stats#index'
  get '/tools/trackchanges', to: 'trackchanges#index'
  post '/tools/trackchanges', to: 'trackchanges#get_changes'
  get '/tools/trackform', to: 'trackchanges#trackform'
  get '/Contact', to: 'contacts#index'
end
