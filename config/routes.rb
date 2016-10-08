Rails.application.routes.draw do
  root 'pages#home'

  # API
  post '/thoughts' => 'thoughts#create'
  post '/dias' => 'days#create'
  post '/subscriptions' => 'subscriptions#create'
  get '/dias/current' => 'days#current'

  # Website
  get '/projects', to: redirect('/projects/untitled-october')
  get '/projects/this-website', to: redirect('/story')
  get '/projects/:slug' => 'projects#show'
  get '/dias/:id' => 'days#show'
  get '/story' => 'days#index'

  # Catchall
  get '/:action', controller: 'pages'
end
