Rails.application.routes.draw do
  root 'pages#home'

  get '/projects/:slug' => 'projects#show'
  get '/:action', controller: 'pages'
end
