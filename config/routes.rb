Rails.application.routes.draw do
  resources :stations, only: [:index, :show] do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end
  root 'categories#index'
  resources :categories
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
