Rails.application.routes.draw do
  root 'pages#home'

  # API
  post '/thoughts' => 'thoughts#create'
  post '/dias' => 'days#create'
  post '/subscriptions' => 'subscriptions#create'
  get '/dias/current' => 'days#current'

  # Website
  get '/projects', to: redirect('/projects/this-website')
  get '/projects/:slug' => 'projects#show'
  get '/dias/:id' => 'days#show'

  # Catchall
  get '/:action', controller: 'pages'
end
