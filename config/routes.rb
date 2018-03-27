Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sellers, only: [:new, :create, :edit, :update, :show] do
    resources :offers
  end
  resources :buyers, only: [:new, :create, :edit, :update, :show]

  root to: 'pages#home'

end
