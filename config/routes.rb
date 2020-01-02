Rails.application.routes.draw do
  devise_for :users
  resources :stations, only: [:index, :show] do
    resources :comments, only: [:new, :create]
    collection do
      get 'search'
    end
  end
  root 'stations#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end