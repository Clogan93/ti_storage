# frozen_string_literal: true
Rails.application.routes.draw do
  resources :locations, only: [:show, :index]

  get 'checkout', to: 'checkout#new'
  post 'checkout/step_1'
  post 'checkout/step_2'

  get 'search', to: 'search#index'

  # storage solutions
  scope 'static_pages', module: 'static_pages' do
    get 'commercial-storage', to: 'storage_solutions#commercial_storage'
    get 'household-storage',  to: 'storage_solutions#household_storage'
    get 'wine-storage', to: 'storage_solutions#wine_storage'
    get 'boat-storage', to: 'storage_solutions#boat_storage'
    get 'car-storage',  to: 'storage_solutions#car_storage'
  end

  get 'contact',      to: 'static_pages#contact'
  get 'sizing-guide', to: 'static_pages#sizing_guide'

  root to: 'static_pages#home'
end
