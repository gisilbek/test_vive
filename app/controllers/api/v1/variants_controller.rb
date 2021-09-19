module Api
  module V1
    class VariantsController < ApplicationController
      before_action :set_variant, only: [:show, :update, :destroy]

      # GET /variants
      def index
        @variants = Variant.all

        render json: @variants
      end

      # GET /variants/1
      def show
        render json: @variant
      end

      # POST /variants
      def create
        @variant = Variant.new(variant_params)

        if @variant.save
          render json: @variant, status: :created, location: @variant
        else
          render json: @variant.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /variants/1
      def update
        if @variant.update(variant_params)
          render json: @variant
        else
          render json: @variant.errors, status: :unprocessable_entity
        end
      end

      # DELETE /variants/1
      def destroy
        @variant.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_variant
        @variant = Variant.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def variant_params
        params.require(:variant).permit(:name, :precio, :product)
      end
    end
  end
end