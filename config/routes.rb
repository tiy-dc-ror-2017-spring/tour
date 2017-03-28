Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :sessions, only: [:new, :create, :destroy]

  # get 'bookings/index', controller: "bookings", action: "index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  # get "/", controller: "welcome", action: "homepage"

  root controller: "welcome", action: "homepage"

  # get "/bookings", controller: "bookings", action: "index", as: "bookings"
  # get "/bookings/new", controller: "bookings", action: "new", as: "bookings_new"
  # get "/bookings/:id/edit", controller: "bookings", action: "edit", as: "edit_booking"
  # post "/bookings", controller: "bookings", action: "create"
  # patch "/bookings/:id", controller: "bookings", action: "update"
  # delete "/bookings/:id", controller: "bookings", action: "destroy"

  resources :bookings
  resources :customers
end
