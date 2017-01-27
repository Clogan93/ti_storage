# frozen_string_literal: true
Rails.application.routes.draw do
  namespace :admin do
    resources :carts
    resources :queues
    resources :subscriptions
  end

  resources :subscriptions, only: [:create]
  resource :contact, only: [:show, :create]

  resources :sites, only: [] do
    resources :units, only: [] do
      resource :reserve, only: [:create]
    end
  end

  resource :reservation, only: [:show, :create, :update] do
    resource :insurance_provider, only: [:create]
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
  get 'google+', to: 'static_pages#google_reviews'


  get 'locations', to: 'sites#index'

  # redirects
  get '/self-storage/ny/brooklyn/treasure-island-redhook', to: redirect('/brooklyn/red-hook', status: 301)
  get '/self-storage/ny/queens/treasure-island-jamaica', to: redirect('/queens/jamaica', status: 301)
  get '/self-storage/nj/paterson/treasure-island-paterson', to: redirect('/new-jersey/paterson', status: 301)
  get '/self-storage/nj/woodbridge/treasure-island-woodbridge', to: redirect('/new-jersey/woodbridge', status: 301)
  get '/self-storage/ny/ozone-park/treasure-island-storage-ozone-park', to: redirect('/queens/ozone-park', status: 301)
  get '/our-locations', to: redirect('/locations', status: 301)
  get '/contact-us', to: redirect('/contact', status: 301)
  get '/self-storage/nj', to: redirect('/new-jersey', status: 301)
  get '/ti-art-studios', to: redirect('/art-storage', status: 301)
  get '/self-storage/ny/brooklyn/treasure-island-redhook', to: redirect('/brooklyn/red-hook', status: 301)
  get '/self-storage/ny/queens/treasure-island-jamaica', to: redirect('/queens/jamaica', status: 301)
  get '/self-storage/nj/paterson/treasure-island-paterson', to: redirect('/new-jersey/paterson', status: 301)
  get '/self-storage/nj/woodbridge/treasure-island-woodbridge', to: redirect('/new-jersey/woodbridge', status: 301)
  get '/our-locations', to: redirect('/locations', status: 301)
  get '/contact-us', to: redirect('/contact', status: 301)
  get '/self-storage/nj', to: redirect('/new-jersey', status: 301)
  get '/ti-art-studios', to: redirect('/art-storage', status: 301)
  get '/self-storage/ny/ozone-park/treasure-island-storage-ozone-park', to: redirect('/queens/ozone-park', status: 301)
  get '/media', to: redirect('/', status: 301)
  get '/careers', to: redirect('/', status: 301)
  get '/acquisitions', to: redirect('/', status: 301)
  get '/privacy-policy', to: redirect('/', status: 301)
  get '/company-information', to: redirect('/', status: 301)
  get '/storage-packing', to: redirect('/', status: 301)
  get '/packing-supplies', to: redirect('/', status: 301)
  get '/tips-and-services', to: redirect('/', status: 301)
  get '/self-storage/nj/paterson/', to: redirect('/new-jersey/paterson', status: 301)
  get '/self-storage/ny/queens/', to: redirect('/queens', status: 301)
  get '/self-storage/ny/glendale/', to: redirect('/', status: 301)
  get '/self-storage/ny/new-york/', to: redirect('/', status: 301)
  get '/self-storage/ny/ozone-park/', to: redirect('/queens/ozone-park', status: 301)
  get '/self-storage/ny/brooklyn/red-hook/', to: redirect('/brooklyn/red-hook', status: 301)
  get '/self-storage/ny/glendale/treasure-island-glendale', to: redirect('/', status: 301)
  get '/self-storage/ny/brooklyn/treasure-island-brooklyn/', to: redirect('/brooklyn', status: 301)
  get '/self-storage/ny/bronx/treasure-island-cromwell/', to: redirect('/', status: 301)
  get '/self-storage/nj/paterson/treasure-island-paterson/reviews', to: redirect('/new-jersey/paterson#reviews', status: 301)
  get '/self-storage/ny/brooklyn/treasure-island-storage/reviews', to: redirect('/brooklyn/red-hook#reviews', status: 301)
  get '/self-storage/ny/brooklyn/treasure-island-redhook/features', to: redirect('/brooklyn/red-hook#features', status: 301)
  get '/self-storage/ny/queens/treasure-island-jamaica/coupon', to: redirect('/', status: 301)
  get '/self-storage/ny/queens/treasure-island-jamaica/reviews', to: redirect('/queens/jamaica#reviews', status: 301)
  get '/self-storage/nj/woodbridge/treasure-island-woodbridge/reviews', to: redirect('/new-jersey/woodbridge#reviews', status: 301)
  get '/self-storage/ny/brooklyn/treasure-island-brooklyn-remsen/', to: redirect('/', status: 301)
  get '/self-storage/nj/paterson/treasure-island-paterson/storage-solutions', to: redirect('/new-jersey/paterson', status: 301)
  get '/self-storage/ny/brooklyn/treasure-island-redhook/storage-solutions', to: redirect('/brooklyn/red-hook', status: 301)
  get '/self-storage/ny/queens/treasure-island-jamaica/map-directions', to: redirect('/queens/jamaica#directions', status: 301)
  get '/self-storage/nj/paterson/treasure-island-paterson/household-storage', to: redirect('/new-jersey/paterson', status: 301)
  get '/self-storage/ny/brooklyn/treasure-island-redhook/household-storage', to: redirect('/brooklyn/red-hook', status: 301)
  get '/self-storage/nj/woodbridge/treasure-island-woodbridge/household-storage', to: redirect('/new-jersey/woodbridge', status: 301)
  get '/self-storage/nj/woodbridge/treasure-island-woodbridge/free-estimate', to: redirect('/new-jersey/woodbridge', status: 301)
  get '/self-storage/ny/glendale/treasure-island-glendale/privacy-policy', to: redirect('/', status: 301)
  get '/self-storage/nj/paterson/treasure-island-paterson/privacy-policy', to: redirect('/', status: 301)
  get '/self-storage/nj/woodbridge/treasure-island-woodbridge/photo-gallery', to: redirect('/new-jersey/woodbridge', status: 301)
  get '/self-storage/nj/woodbridge/treasure-island-woodbridge/storage-solutions', to: redirect('/new-jersey/woodbridge', status: 301)
  get '/self-storage/nj/paterson/treasure-island-paterson/photo-gallery', to: redirect('/new-jersey/paterson', status: 301)
  get '/self-storage/ny/brooklyn/treasure-island-redhook/photo-gallery', to: redirect('/brooklyn/red-hook', status: 301)
  get '/self-storage/ny/brooklyn/treasure-island-redhook/boat-storage', to: redirect('/brooklyn/red-hook', status: 301)
  get '/self-storage/nj/woodbridge/treasure-island-woodbridge/boat-storage', to: redirect('/new-jersey/woodbridge', status: 301)
  get '/self-storage/ny/queens/treasure-island-jamaica/contact-us', to: redirect('/queens/jamaica', status: 301)
  get '/self-storage/ny/brooklyn/treasure-island-redhook/contact-us', to: redirect('/brooklyn/red-hook', status: 301)
  get '/self-storage/nj/woodbridge/treasure-island-woodbridge/commercial-storage', to: redirect('/new-jersey/woodbridge', status: 301)
  get '/self-storage/nj/paterson/treasure-island-paterson/car-storage', to: redirect('/new-jersey/paterson', status: 301)
  get '/self-storage/ny/queens/treasure-island-jamaica/map-hours', to: redirect('/queens/jamaica', status: 301)
  get '/self-storage/ny/queens/treasure-island-jamaica/boat-storage', to: redirect('/queens/jamaica', status: 301)
  get '/self-storage/nj/paterson/treasure-island-paterson/map-directions', to: redirect('/new-jersey/paterson', status: 301)
  get '/self-storage/ny/queens/treasure-island-jamaica/free-estimate', to: redirect('/queens/jamaica', status: 301)
  get '/self-storage/ny/brooklyn/treasure-island-redhook/car-storage', to: redirect('/brooklyn/red-hook', status: 301)
  get '/self-storage/ny/bronx/treasure-island-cromwell/contact-us', to: redirect('/', status: 301)
  get '/self-storage/nj/woodbridge/treasure-island-woodbridge/contact-us', to: redirect('/new-jersey/woodbridge', status: 301)
  get '/self-storage/ny/brooklyn/treasure-island-brooklyn-remsen/privacy-policy', to: redirect('/', status: 301)
  get '/p/self_storage/storage_unit_1794/woodbridge-nj-07095/treasure-island-storage-1794', to: redirect('/new-jersey/woodbridge', status: 301)
  get '/self-storage/nj/paterson/treasure-island-paterson/u-haul-rentals', to: redirect('/new-jersey/paterson', status: 301)
  get '/p/self_storage/hours_1791/brooklyn-ny-11231/treasure-island-storage-1791', to: redirect('/brooklyn/red-hook', status: 301)
  get '/self-storage/ny/queens/treasure-island-jamaica/u-haul-rentals', to: redirect('/queens/jamaica', status: 301)
  get '/self-storage/nj/paterson/treasure-island-paterson/unit-sizes-prices', to: redirect('/new-jersey/paterson', status: 301)
  get '/self-storage/ny/queens/treasure-island-jamaica/unit-sizes-prices', to: redirect('/queens/jamaica', status: 301)
  get '/self-storage/ny/new-york/treasure-island-manhattan-122/privacy-policy', to: redirect('/brooklyn/red-hook', status: 301)
  get '/self-storage/ny/ozone-park/treasure-island-storage-ozone-park/coupon', to: redirect('/queens/ozone-park', status: 301)
  get '/self-storage/ny/queens/jamaica/', to: redirect('/queens/jamaica', status: 301)

  Area.all.each do |area|
    get "/#{area.slug}/:id", to: 'sites#show', as: "#{area.path_prefix}_site", defaults: { area_id: area.slug }
    get "/#{area.slug}", to: 'areas#show', as: "#{area.path_prefix}", defaults: { id: area.slug }
  end

  root to: 'static_pages#home'
end
