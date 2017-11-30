Rails.application.routes.draw do
  resources :friendships, only: [:new]
  resources :friend_requests, only: [:index, :destroy, :new]
  devise_for :users

  authenticated :user do
  	root 'users#show', as: :authenticated_root  
  end

  devise_scope :user do
		root to: "devise/sessions#new"
	end
	
	resources :users
end
