RailsAdmin::Engine.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  scope protocol: 'https://', constraints: {protocol: 'https://'} do
    resources :radmin
  end

  get "polly", to: "rails_admin.polly_path"
  # get "googlemapsadmin", to: "rails_admin.googlemapsadmin_path"
end

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  # get 'errors/not_found'
  # get 'errors/internal_server_error~'
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  #  :controllers => { :sessions => 'sessions' }
  scope '/employee' do
    resources :users
  end
  root to: 'pages#index'
  get "residential", to: "pages#residential"
  get "commercial", to: "pages#commercial"
  get "quote", to: "quotes#new"
  get "index", to: "pages#index"
  post "lead", to: "lead#create"
  get "login", to: "pages#login"
  get 'users/:id' => 'users#show'
  get "interventionform", to: "intervention#intervention"
  post "intervention", to: "intervention#create"
  # get "gmaps", to: 'rails_admin#main#google'
  # get 'google', to: "pages#google"

#   get 'google', to: "pages#google"
  # patch 'elevators/:status', to: "elevator#update"
 # get "portfolio", to: "pages#portfolio"

  resources :quotes

  resources :customer do
    collection do
      get :search
    end
  end

  resources :building do 
    collection do 
      get :search
    end
  end

  resources :battery do 
    collection do 
      get :search
    end
  end

  resources :column do 
    collection do 
      get :search
    end
  end

  resources :elevator do 
    collection do 
      get :search
    end
  end
  
  resources :employee do 
    collection do 
      get :search
    end
  end

  resources :address do
    collection do
      get :search
    end
  end

end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html