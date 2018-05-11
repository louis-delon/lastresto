Rails.application.routes.draw do

  root to: 'pages#home'

  namespace :admin do
    resources :sellers
    resources :buyers
    resources :categories
    resources :offers
    resources :preferences
    resources :reservations

    root to: "sellers#index"
  end

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

  # create/update/destroy an offer can be settled only by a seller
  resources :sellers, only: :show do
    resources :offers, except: [:show, :index]
  end

  # show an offer can be only applied by a buyer from homepage
  # by this path, buyer can then make a reservation
  resources :offers, only: [:index, :show] do
    resources :reservations, only: :create
  end

  resources :buyers, only: :show do
    resources :reservations, only: [:index, :destroy, :edit, :update]
    resources :preferences
  end

  # alllow to display its own offers to a seller
  namespace :myadmins do
    resources :offers, only: :index do
      resources :reservations, only: :index
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
