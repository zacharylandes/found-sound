Rails.application.routes.draw do

  root :to => 'main#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
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


  resources :users , only: [:new, :create, :update]
  get '/account/edit', to: "users#edit", as: "edit_user"

  resources :orders, only: [:index, :create, :show, :update]

  resources :dashboard, only: [:index]

  resources :items, only: [:show]

  # resources :cart, only: [:index, :create, :update, :destroy]
  get '/cart', to: 'cart#index', as: 'cart'
  post '/cart', to: 'cart#create'
  patch '/cart', to: 'cart#update'
  put '/cart', to: 'cart#update'
  delete '/cart', to: 'cart#destroy'

  namespace :categories do
    get '/:category', to: 'categories#show', param: :slug, as: "category"
  end

  namespace :api do
    namespace :v1 do
      get '/search', to: 'search#index'
    end
  end

  resources :stores, only:[:index, :new, :create]
  get '/:store/manage', to: "stores#edit"
  put '/:store/manage', to: "stores#update", as: "edit_store"

  get '/:store/employees', to: "stores/employees#update", as: "employees"
  get '/:store', to: 'stores#show', as: "store"


  get "/settings/developer", to: 'developer#show', as: 'developer'
  post "/settings/developer", to: 'developer#create'

end
