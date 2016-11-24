# frozen_string_literal: true
Rails.application.routes.draw do
  resources :locations, only: [:show, :index]

  get 'checkout', to: 'checkout#new'
  post 'checkout/step_1'
  post 'checkout/step_2'

  get 'search', to: 'search#index'

  # storage solutions
  get 'commercial-storage', to: 'static_pages#commercial_storage'
  get 'household-storage',  to: 'static_pages#household_storage'
  get 'wine-storage', to: 'static_pages#wine_storage'
  get 'boat-storage', to: 'static_pages#boat_storage'
  get 'car-storage',  to: 'static_pages#car_storage'

  get 'contact', to: 'static_pages#contact'

  root to: 'static_pages#home'
end
