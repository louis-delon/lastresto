Rails.application.routes.draw do

  devise_for :sellers, controllers: {
        sessions: 'sellers/sessions',
        registrations: 'sellers/registrations'
      }

  devise_for :buyers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/restaurantspace'

  resources :sellers, only: [ :edit, :update, :show] do
    resources :offers
  end
  resources :buyers, only: [ :edit, :update, :show] do
    resources :reservations, only: [:new, :create, :edit, :update, :show]
  end

  root to: 'pages#home'

end
