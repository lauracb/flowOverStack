Rails.application.routes.draw do
  devise_for :users
  root 'questions#index'

  resources :questions, except: [:edit, :update, :destroy] do
    resources :answers 
    resources :comments
    resource :vote, only: [:create, :destroy]
  end

  resources :answers do
    resources :comments
    resource :vote, only: [:create, :destroy]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
