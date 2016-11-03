# frozen_string_literal: true
Rails.application.routes.draw do
  resources :locations, only: :show

  get 'search', to: 'search#index'

  root to: 'static_pages#home'
end
