# typed: false
Rails.application.routes.draw do
  match '*all', controller: 'application', action: 'cors_preflight_check', via: [:options]
  get '/', to: 'application#home'

  post '/institution_authorization/begin', to: 'institution_authorization#begin'
  post '/institution_authorization/complete', to: 'institution_authorization#complete'

  post '/users', to: 'users#create'
  post '/login', to: 'users#authenticate'
end
