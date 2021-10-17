# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root 'home#index'
      get 'products', to: 'products#index'
      post 'products', to: 'products#create'
      # get "variants", to: 'variants#index'
      post 'variants', to: 'variants#create'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
