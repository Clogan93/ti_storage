# rubocop:disable BlockLength
# frozen_string_literal: true
Rails.application.routes.draw do
  resources :locations, only: [:index]

  [:brooklyn, :queens, :'new-jersey'].each do |area_slug|
    get "#{area_slug}/:slug", to: 'locations#show'
  end
  get ":area_slug", to: 'locations#index', constraints: {
    area_slug: /brooklyn|queens|new-jersey/
  }

  get 'checkout', to: 'checkout#new'
  post 'checkout/step_1'
  post 'checkout/step_2'

  get 'search', to: 'search#index'

  # storage solutions
  scope '/', module: 'static_pages' do
    get 'storage-solutions', to: 'storage_solutions#index'
    get 'commercial-storage', to: 'storage_solutions#commercial_storage'
    get 'household-storage',  to: 'storage_solutions#household_storage'
    get 'wine-storage', to: 'storage_solutions#wine_storage'
    get 'boat-storage', to: 'storage_solutions#boat_storage'
    get 'car-storage',  to: 'storage_solutions#car_storage'
    get 'art-storage',  to: 'storage_solutions#art_storage'
  end

  get 'myaccount',    to: 'static_pages#myaccount'
  get 'contact',      to: 'static_pages#contact'
  get 'sizing-guide', to: 'static_pages#sizing_guide'
  get 'faq', to: 'static_pages#faq'
  get 'moving-services', to: 'static_pages#moving_services'

  root to: 'static_pages#home'
end
