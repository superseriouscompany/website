Rails.application.routes.draw do
  root 'pages#home'

  # API
  post '/thoughts'         => 'thoughts#create'
  post '/dias'             => 'days#create'
  post '/subscriptions'    => 'subscriptions#create'
  post '/progress_updates' => 'progress_updates#create'
  get '/dias/current'      => 'days#current'

  # Website
  get '/projects', to: redirect('/projects/giggles')
  get '/projects/untitled-october', to: redirect('/projects/giggles')
  get '/projects/this-website', to: redirect('/story')
  get '/projects/:slug' => 'pages#show_project'
  get '/dias/:id' => 'pages#show_day'
  get '/story' => 'pages#story'
  get '/support/giggles' => 'pages#giggles_support'
  get '/neil-sarkar' => 'pages#neil'
  get '/santi-garza' => 'pages#santi'

  # RSS (thanks a lot caldwell)
  get '/feed', to: 'days#feed'

  # Catchall
  get '/:action', controller: 'pages'
end
