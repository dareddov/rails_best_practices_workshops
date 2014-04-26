RailsBestPracticesWorkshops::Application.routes.draw do
  get 'offer_for_request/new'

  get 'offer_for_request/create'
  devise_for :users
  resources :offers
    root 'requests#index'

  resources :requests

  resources :users

end
