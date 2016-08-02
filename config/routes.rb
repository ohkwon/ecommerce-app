Rails.application.routes.draw do

  get '/products', to: 'products#index'
  get '/', to: 'products#index'
  get '/products/new', to: 'products#new'
  get '/products/:id', to: 'products#show'
  post '/products', to: 'products#create'
  get '/products/:id/edit', to: 'products#edit'
  patch '/products/:id', to: 'products#update'
  delete '/products/:id', to: 'products#destroy'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get '/accounts', to: 'users#show'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
