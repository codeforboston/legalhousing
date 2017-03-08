Rails.application.routes.draw do
  root to: 'listings#index'
  resources :listings, :phrases, :issues, :categories
  get '/discriminatory', to: 'listings#discriminatory'
  get '/check_all_listings', to: 'listings#check_all_listings'
  get '/import_phrases', to: 'phrases#import_phrases'
  get '/scrub_phrases', to: 'phrases#scrub_phrases'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
