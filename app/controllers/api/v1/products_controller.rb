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

        # @product = Product.new(product_params)

        # if @product.save
        #   render json: @product, status: :created, location: @product
        # else
        #   render json: @product.errors, status: :unprocessable_entity
        # end

        product = Product.new(product_params)
        variant = params[:variants]
        product.variants.build(name: variant[0]['name'],precio:variant[0]['price'])
        p '-------'
        p product
        p variant
        #p product.variants
        return bad_request(product.errors) unless product.save
        params[:id] = product.id
        #created_variants
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

      # def created_variants

      #   p '-----------------'
      #   p params[:variants]

      #   if(params[:variants].present?)

      #     # # clean previous variantes
      #     # if(product.variants.present?)
      #     #   product.variants.each do |i|
      #     #     if i.present?
      #     #       i.destroy
      #     #     end
      #     #   end
      #     # else
      #     #   product.variants = [];
      #     # end

      #     # create new Variant

      #     product = Product.last(1)
      #    # product.variants = []
      #     params[:variants].each do |a_variants|
      #       newVariant = Variant.new(
      #         name: a_variants[:name],
      #         precio: a_variants[:precio],
      #         product_id: product[0].id
      #       )
      #       product.variants << newVariant
      #     end
      #     product.save
      #   end
      # end

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