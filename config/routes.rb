# frozen_string_literal: true
Rails.application.routes.draw do
  namespace :admin do
    resources :storages do
      collection do
        post 'sync'
      end

      resources :storage_units do
        collection do
          post 'sync'
        end
      end
    end
  end

  resources :locations, only: [:index]

  get 'checkout', to: 'checkout#new'
  post 'checkout/step_1'
  post 'checkout/step_2'

  post 'emails/send_sign_up_for_emails_email'

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
  get 'sizing-guide', to: 'static_pages#sizing_guide'

  # in header: why store with us?
  get 'why-store-with-us', to: 'static_pages#why_store_with_us'
  get 'faq', to: 'static_pages#faq'
  get 'moving-services', to: 'static_pages#moving_services'
  get 'contact', to: 'static_pages#contact'

  root to: 'static_pages#home'

  # must be in the end, matches all
  get "locations", to: 'locations#locations'
  get ":category_slug/:storage_slug", to: 'locations#show', as: :sluggable_location
  get ":category_slug", to: 'locations#index'
end
