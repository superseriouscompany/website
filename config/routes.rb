Rails.application.routes.draw do
  root 'pages#home'

  post '/thoughts' => 'thoughts#create'
  get '/projects', to: redirect('/projects/this-website')
  get '/projects/:slug' => 'projects#show'
  get '/dias/:id' => 'days#show'
  post '/dias' => 'days#create'

  # Catchall
  get '/:action', controller: 'pages'
end
