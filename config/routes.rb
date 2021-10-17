# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root 'home#index'
      resources :products
      resources :variants
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
