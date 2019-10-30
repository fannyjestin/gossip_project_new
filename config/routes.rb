Rails.application.routes.draw do

root "gossips#index"

resources :gossips
resources :users
resources :cities 
resources :comments


  get '/contact', to: 'static_pages#contact'

  get '/team', to: 'static_pages#team'

  get '/welcome/:id', to: 'dynamic_pages#welcome'

end
