FAFLabs::Application.routes.draw do
  devise_for :users
  root to: 'pages#index'

  controller :dashboard do
    get '/dashboard' => :index
  end

  resources :courses
end
