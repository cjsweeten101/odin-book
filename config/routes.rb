Rails.application.routes.draw do
  resources :friend_requests
  devise_for :users

  authenticated :user do
  	root 'users#show', as: :authenticated_root  
  end

  devise_scope :user do
		root to: "devise/sessions#new"
	end
	
	resources :users
end
