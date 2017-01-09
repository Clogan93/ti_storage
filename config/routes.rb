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

  resource :reservation, only: [:show, :create, :update] do
    resource :checkout, only: [:show, :update]
    resource :lease, only: [:show]
  end

  post 'emails/send_sign_up_for_emails_email'
  post 'emails/send_contact_email'

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
  get 'google+', to: 'static_pages#google_reviews'

  root to: 'static_pages#home'

  get 'locations', to: 'locations#locations'
  # must be in the end, matches all
  get ":category_slug/:storage_slug", to: 'locations#show', as: :sluggable_location
  get ":category_slug", to: 'locations#index'
end
