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

  resources :buyers, only: :show

  # show an offer can be only requested by a buyer from homepage
  resources :offers, only: :show do
    resources :reservations
  end

  # create/update/destroy an offer can be settled only by a seller
  resources :sellers, only: :show do
    resources :offers, except: :show
  end


  # alllow to display its own offers to a seller
  namespace :myoffers do
    resources :offers, only: [:index]
  end






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
