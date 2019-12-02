Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'cocktails#index'
  resources :doses, only: :destroy
  resources :cocktails, except: %i[edit update destroy] do
    resources :doses, only: %i[new create]
    resources :reviews, only: :create
  end
end
