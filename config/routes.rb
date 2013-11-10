Money::Application.routes.draw do
  resources :users
  resources :identities
  resources :sessions, :only => [:new, :create, :destroy]
  match '/signin',   :to => 'sessions#new'
  match '/signout',  :to => 'sessions#destroy' #,via: :delete
  match "/auth/:provider/callback", to: "sessions#create"
  match "/auth/failure", to: "sessions#failure"
  root :to => "users", :action =>'index'
  match '/:controller(/:action(/:id))'
end
