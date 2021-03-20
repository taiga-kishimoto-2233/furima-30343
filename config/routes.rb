Rails.application.routes.draw do
  devise_for :users
  root to: 'furima#index'
  resources :users do
    resources :items, only: [:index, :new, :edit, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
