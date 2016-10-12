Rails.application.routes.draw do
  root 'pages#home'

  # API
  post '/thoughts'         => 'thoughts#create'
  post '/dias'             => 'days#create'
  post '/subscriptions'    => 'subscriptions#create'
  post '/progress_updates' => 'progress_updates#create'
  get '/dias/current'      => 'days#current'

  # Website
  get '/projects', to: redirect('/projects/untitled-october')
  get '/projects/this-website', to: redirect('/story')
  get '/projects/:slug' => 'pages#show_project'
  get '/dias/:id' => 'pages#show_day'
  get '/story' => 'pages#story'

  # Catchall
  get '/:action', controller: 'pages'
end
