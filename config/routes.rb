Rails.application.routes.draw do
  get 'cards/index'
  post 'cards/new'
  get 'cards/show'
  delete 'cards/destroy'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'items#index'
  resources :items, only: [:index, :new, :create]
  resources :cards, only: [:index, :new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
