# frozen_string_literal: true
Rails.application.routes.draw do
  resources :locations, only: [:show, :index]

  resources :checkout, only: :new

  get 'search', to: 'search#index'

  get 'storage-solutions', to: 'static_pages#storage_solutions'
  root to: 'static_pages#home'
end
