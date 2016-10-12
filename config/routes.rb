# frozen_string_literal: true
Rails.application.routes.draw do
  resources :locations, only: :show

  get 'static_pages/home'
end
