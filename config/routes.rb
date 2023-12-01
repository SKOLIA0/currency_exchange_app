Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :currency_rates do
    collection do
      get :weekly_change
    end
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root 'currency_rates#index'
  get "up" => "rails/health#show", as: :rails_health_check
  get 'currency_rates', to: 'currency_rates#index'
  get 'currency_rates/weekly_change', to: 'currency_rates#weekly_change'

  # Defines the root path route ("/")
  # root "posts#index"
end
