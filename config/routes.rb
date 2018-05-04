Rails.application.routes.draw do

  namespace :admin do
    resources :sellers
    resources :buyers
    resources :categories
    resources :offers
    resources :preferences
    resources :reservations

    root to: "sellers#index"
  end

  # alllow to display its own offers to a seller
  namespace :myoffers do
    resources :offers, only: [:index]
  end

  root to: 'pages#home'

  # allow to setup devise controllers to override default devise controllers,
  # for details, see in App/controllers/sellers/
  devise_for :sellers, controllers: {
        sessions: 'sellers/sessions',
        registrations: 'sellers/registrations',
        passwords: 'sellers/passwords'
      }

  devise_for :buyers, controllers: {
        sessions: 'buyers/sessions',
        registrations: 'buyers/registrations',
        passwords: 'buyers/passwords'
      }

  resources :sellers, only: [ :show] do
    resources :offers
  end

  resources :buyers, only: [ :show] do
    resources :reservations, only: [:new, :create, :edit, :update, :show]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
