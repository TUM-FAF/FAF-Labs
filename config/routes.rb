FAFLabs::Application.routes.draw do
  # devise_for :users
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end
  root to: 'pages#index'

  controller :dashboard do
    get '/dashboard' => :index
  end

  resources :courses do
  	resources :subgroups
  end

  resources :subgroups do
  	resources :assignments
    put '/assignments/:id/update_published', to: 'assignments#update_published', as: 'update_published'
  end


end
