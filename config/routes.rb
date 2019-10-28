Rails.application.routes.draw do

  get '/contact', to: 'static_pages#contact'

  get '/team', to: 'static_pages#team'

  get '/home', to: 'static_pages#home'

  get '/gossip/:id', to: 'dynamic_pages#gossip', as: 'gossip'

  get '/welcome/:id', to: 'dynamic_pages#welcome', as: 'user'
end
