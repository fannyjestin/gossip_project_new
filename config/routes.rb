Rails.application.routes.draw do
  get '/welcome/:first_name', to: 'dynamic_pages#welcome'


  get '/contact', to: 'static_pages#contact'

  get '/team', to: 'static_pages#team'

  get '/welcome', to: 'static_pages#welcome'

end
