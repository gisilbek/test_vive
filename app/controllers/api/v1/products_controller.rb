# frozen_string_literal: true

module Api
  module V1
    # app/controllers/api/v1/variants_controller.rb

    # Controller Variants
    class ProductsController < ApplicationController
      before_action :set_product, only: %i[show update destroy]

      # GET /products
      def index
        @products = Product.all
        render json: @products
      end

      # POST /products
      def create
        product = Product.new(product_params)
        variant = params[:variants]
        variant.each do |var|
          product.variants.build(name: var['name'], precio: var['price'])
          return bad_request(product.errors) unless product.save

          params[:id] = product.id
        end
        render json: product, status: :created
      end

      # PATCH/PUT /products/1
      def update
        if @product.update(product_params)
          render json: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def product_params
        params.require(:product).permit(:name, :description, variants_attributes: %i[name precio])
      end
    end
  end
end
