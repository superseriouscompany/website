Rails.application.routes.draw do
  root 'pages#home'

  post '/thoughts' => 'thoughts#create'
  get '/projects', to: redirect('/projects/this-website')
  get '/projects/:slug' => 'projects#show'
  get '/:action', controller: 'pages'
end
