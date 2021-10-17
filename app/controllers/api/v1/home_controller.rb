# frozen_string_literal: true

module Api
  module V1
    # app/controllers/api/v1/variants_controller.rb

    # Controller Variants
    class HomeController < ApplicationController
      def index
        array_count = []
        @not_loaded_product = Product.not_loaded_product
        @loaded_product = Product.loaded_product
        array_count << @loaded_product
        array_count << 'productos cargados.'
        array_count << @not_loaded_product
        array_count << 'productos no cargados.'
        render json: array_count
      end
    end
  end
end
