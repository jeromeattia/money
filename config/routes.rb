Money::Application.routes.draw do

  get '/comptes/list', to: 'comptes#list', as: 'list'

  resources :users
  resources :identities
  resources :comptes
  resources :sessions, :only => [:new, :create, :destroy]
  match '/signin',   :to => 'sessions#new'
  match '/signout',  :to => 'sessions#destroy' #,via: :delete
  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/failure", to: "sessions#failure"
  root :to => "comptes", :action =>'index'
  match '/:controller(/:action(/:id))'
end
