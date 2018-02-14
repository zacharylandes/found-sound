Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  root :to => 'main#index'

  get 'signout', to: 'sessions#destroy', as: 'signout'

  get '/login', :to => 'sessions#new', :as => 'login'
  post '/login', :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'
  get '/logout', :to => 'sessions#destroy'

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :items, only: [:index, :edit, :new, :create, :update]
    resources :analytics, only: [:index]
    resources :stores, only: [:index, :update]
  end

    resources :charges

  get '/auth/twitter', as: :twitter_login
  get '/auth/twitter/store', to: "twitter#edit", as: "new_twitter"
  get '/auth/twitter/callback', to: "twitter#update"
  delete '/auth/twitter/store', to: "twitter#destroy", as: "remove_twitter"
  post "/twitter", to: "twitter#create", as: "new_tweet"

  resources :users , only: [:new, :create, :update]
  get '/account/edit', to: "users#edit", as: "edit_user"

  resources :orders, only: [:index, :new, :create, :show, :update]

  resources :dashboard, only: [:index]

  resources :items, only: [:show]
  resources :store_orders, only: [:show,:update]

  resources :views, only: [:create, :destroy]

  # resources :cart, only: [:index, :create, :update, :destroy]
  get '/cart', to: 'cart#index', as: 'cart'
  post '/cart', to: 'cart#create'
  patch '/cart', to: 'cart#update'
  put '/cart', to: 'cart#update'
  delete '/cart', to: 'cart#destroy'

  namespace :departments do
    get '/:department', to: 'departments#show', as: 'department'
  end

  namespace :api do
    namespace :v1 do
      get '/search', to: 'search#index'
    end
  end

  resources :stores, only:[:index, :new, :create]
  get '/:store/items/new', to: "items#new", as: "new_store_item"
  post '/:store/items', to: "items#create", as: "store_items"
  get '/:store/items/:id/edit', to: "items#edit", as: "edit_store_item"
  patch '/:store/items/:id/edit', to: "items#update", as: "store_item"


  get '/:store/manage', to: "stores#edit"
  put '/:store/manage', to: "stores#update", as: "edit_store"

  get '/:store/employees', to: "stores/employees#update", as: "employees"
  get '/:store', to: 'stores#show', as: "store"

  get "/settings/developer", to: 'developer#show', as: 'developer'
  post "/settings/developer", to: 'developer#create'

end
