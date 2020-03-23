Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: [:new, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
