Rails.application.routes.draw do

  # allow to setup devise controlers to override default devise controllers,
  # for details, see in App/controllers/sellers/
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
