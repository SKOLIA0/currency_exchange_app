Rails.application.routes.draw do
  resources :currency_rates do
    collection do
      get :weekly_change
    end
  end
  root 'currency_rates#index'
  get "up" => "rails/health#show", as: :rails_health_check
  get 'currency_rates', to: 'currency_rates#index'
  get 'currency_rates/weekly_change', to: 'currency_rates#weekly_change'
end
