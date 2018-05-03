Rails.application.routes.draw do

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

  namespace :administration do
    resources :offers
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :sellers, only: [ :show] do
    resources :offers, only: [:index]
  end
  resources :buyers, only: [ :show] do
    resources :reservations, only: [:new, :create, :edit, :update, :show]
  end

  root to: 'pages#home'

end
