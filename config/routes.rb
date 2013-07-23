FAFLabs::Application.routes.draw do
  # devise_for :users
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end
  root to: 'pages#index'

  controller :dashboard do
    get '/dashboard' => :index
  end

  resources :courses
end
