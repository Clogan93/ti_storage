# frozen_string_literal: true
Rails.application.routes.draw do
  resources :locations, only: [:show, :index]

  get 'checkout', to: 'checkout#new'
  post 'checkout/step_1'
  post 'checkout/step_2'

  get 'search', to: 'search#index'

  get 'storage-solutions', to: 'static_pages#storage_solutions'
  root to: 'static_pages#home'
end
