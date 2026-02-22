Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "registrations#index"
  resources :registrations, only: %i[create index]
end
