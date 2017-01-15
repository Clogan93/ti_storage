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

  resources :storage_units, only: [] do
    member do
      post 'reserve'
    end
  end
  resources :sites, only: [] do
    resources :units, only: [] do
      resource :reserve, only: [:create]
    end
  end

  resource :reservation, only: [:show, :create, :update] do
    resource :checkout, only: [:show, :update]
    resource :lease, only: [:show]
  end

  post 'emails/send_sign_up_for_emails_email'
  post 'emails/send_contact_email'

  get '/search', to: 'search#index'

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

  get 'sizing-guide', to: 'static_pages#sizing_guide'

  # in header: why store with us?
  get 'why-store-with-us', to: 'static_pages#why_store_with_us'
  get 'faq', to: 'static_pages#faq'
  get 'moving-services', to: 'static_pages#moving_services'
  get 'contact', to: 'static_pages#contact'
  get 'google+', to: 'static_pages#google_reviews'


  get 'locations', to: 'sites#index'

  # redirects
  get '/self-storage/ny/brooklyn/treasure-island-redhook', to: redirect('/brooklyn/red-hook', status: 301)
  get '/self-storage/ny/queens/treasure-island-jamaica', to: redirect('/queens/jamaica', status: 301)
  get '/self-storage/nj/paterson/treasure-island-paterson', to: redirect('/new-jersey/paterson', status: 301)
  get '/self-storage/nj/woodbridge/treasure-island-woodbridge', to: redirect('/new-jersey/woodbridge', status: 301)
  get '/our-locations', to: redirect('/locations', status: 301)
  get '/contact-us', to: redirect('/contact', status: 301)
  get '/self-storage/nj', to: redirect('/new-jersey', status: 301)
  get '/ti-art-studios', to: redirect('/art-storage', status: 301)
  get '/self-storage/ny/ozone-park/treasure-island-storage-ozone-park', to: redirect('/queens/ozone-park', status: 301)

  Area.all.each do |area|
    get "/#{area.slug}/:id", to: 'sites#show', as: "#{area.path_prefix}_site", defaults: { area_id: area.slug }
    get "/#{area.slug}", to: 'areas#show', as: "#{area.path_prefix}", defaults: { id: area.slug }
  end
  get "/:area_id/:id", to: 'sites#show', as: :area_site

  # must be in the end, matches all
  get ":category_slug/:storage_slug", to: 'locations#show', as: :sluggable_location
  get ":category_slug", to: 'locations#index'

  root to: 'static_pages#home'
end
