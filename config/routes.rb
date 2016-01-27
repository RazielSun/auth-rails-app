Rails.application.routes.draw do

  root 'users#index'

  resources :users, except: :index

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

end
