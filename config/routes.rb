Rails.application.routes.draw do
  root 'pages#home'

  get '/:action', controller: 'pages'
end
