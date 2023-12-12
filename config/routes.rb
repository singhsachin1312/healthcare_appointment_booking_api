Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :users, only: :create do 
        get "appointment_list", on: :collection
      end
      post '/login', to: 'users#login'
      resources :healthcare_professionals, only: :index do
        get "available_slotes", on: :member
      end

      resources :appointments, only: :create do
        put "cancel_appointment", on: :member
        put "complete_appointment", on: :member
      end
    end
  end
end
