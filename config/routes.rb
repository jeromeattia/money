Money::Application.routes.draw do
  get "comptes/index", :as => "comptes"

  resources :users
  resources :identities
  resources :sessions, :only => [:new, :create, :destroy]
  match '/signin',   :to => 'sessions#new'
  match '/signout',  :to => 'sessions#destroy' #,via: :delete
  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/failure", to: "sessions#failure"
  root :to => "comptes", :action =>'index'
  match '/:controller(/:action(/:id))'
end
