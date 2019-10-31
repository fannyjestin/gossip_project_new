Rails.application.routes.draw do

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
root "gossips#index"

resources :users
resources :cities 
resources :gossips do
	resources :comments
  end 
resources :sessions, only: [:new, :create, :destroy]



  get '/contact', to: 'static_pages#contact'

  get '/team', to: 'static_pages#team'

  get '/welcome/:id', to: 'dynamic_pages#welcome'

end
