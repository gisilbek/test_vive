module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :update, :destroy]

      # GET /products
      def index
        @products = Product.all

        render json: @products
      end

      # GET /products/1
      def show
        render json: @product
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

      # DELETE /products/1
      def destroy
        @product.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def product_params
        params.require(:product).permit(:name, :description, variants_attributes: [:name, :precio])
      end
    end
  end
end
