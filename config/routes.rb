Rails.application.routes.draw do
  root 'pages#home'

  # API
  post '/thoughts'              => 'thoughts#create'
  post '/dias'                  => 'days#create'
  post '/subscriptions'         => 'subscriptions#create'
  post '/progress_updates'      => 'progress_updates#create'
  post '/progress_updates/:id'  => 'progress_updates#update' #FU, httpclient
  patch '/progress_updates/:id' => 'progress_updates#update'
  get '/dias/current'           => 'days#current'

  # Website
  get '/projects'                    => 'pages#projects'
  get '/projects/untitled-october', to: redirect('/projects/giggles')
  get '/projects/:slug'              => 'pages#show_project'
  get '/dias/:id'                    => 'pages#show_day'
  get '/story'                       => 'pages#story'
  get '/support/giggles'             => 'pages#giggles_support'
  get '/support/animals'             => 'pages#animals_support'
  get '/neil-sarkar'                 => 'pages#neil'
  get '/santi-garza'                 => 'pages#santi'
  get '/andrew-sauer'                => 'pages#andrew'

  get '/all' => 'ideas#all'
  get '/halp' => 'ideas#new'
  post '/halp' => 'ideas#create'

  # RSS (thanks a lot caldwell)
  get '/feed', to: 'days#feed'

  # Catchall
  get '/:day', to: redirect('/dias/%{day}'), constraints: { day: /\d+/ }
  get '/:action', controller: 'pages'
end
