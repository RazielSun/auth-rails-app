Rails.application.routes.draw do

	get '/admin' => 'admin#index'
	get '/admin/login' => 'admin#login'

  	root 'users#index'

  	resources :users, except: :index

  	get '/login' => 'sessions#new'
  	post '/login' => 'sessions#create'
  	delete '/logout' => 'sessions#destroy'

end
