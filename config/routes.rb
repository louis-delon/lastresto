Rails.application.routes.draw do

  get 'reservations/new'

  get 'reservations/create'

  get 'reservations/edit'

  get 'reservations/destroy'

  get 'reservations/index'

  get 'reservations/update'

  devise_for :sellers
  devise_for :buyers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sellers, only: [:new, :create, :edit, :update, :show] do
    resources :offers
  end
  resources :buyers, only: [:new, :create, :edit, :update, :show]

  root to: 'pages#home'

end
