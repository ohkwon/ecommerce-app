Rails.application.routes.draw do

  get '/products', to: 'products#index'
  get '/', to: 'products#index'
  get '/products/new', to: 'products#new'
  get '/products/:id', to: 'products#show'
  post '/products', to: 'products#create'
  get '/products/:id/edit', to: 'products#edit'
  patch '/products/:id', to: 'products#update'
  delete '/products/:id', to: 'products#destroy'

  get '/images/new', to: 'images#new'
  post '/images', to: 'images#create'
  get '/images/to_destroy/:product_id', to: 'images#to_destroy'
  delete '/images/:id', to: 'images#destroy'
  get '/products/images/:id', to: 'images#show'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get '/accounts', to: 'users#show'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/orders', to: 'orders#index'
  get '/orders/new', to: 'orders#new'
  post '/orders', to: 'orders#create'
  get '/orders/:id', to: 'orders#show'

  get '/products/:id/consoles/new', to: 'consoles#new'
  post '/consoles', to: 'consoles#create'

end
