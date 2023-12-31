module Api
  module V1
    class ItemsController < ApplicationController
      # to fetch items
      def index
        items = Item.all.map do |item|
          {
            id: item.id,
            name: item.name,
            city: item.city,
            description: item.description,
            price: item.price,
            image: item.image.is_a?(ActiveStorage::Attached::One) ? url_for(item.image) : nil
          }
        end
        render json: items
      end

      # to show items
      def show
        @item = Item.find_by(id: params[:id])

        if @item
          render json: @item
        else
          render json: { error: 'Item not found' }, status: :not_found
        end
      end

      def create
        item = Item.new(item_params)
        if item.save
          render json: item, status: :created
        else
          render json: { errors: item.errors }, status: :unprocessable_entity
        end
      end

      # to delete an item
      def destroy
        item = Item.find(params[:id])
        if item.destroy
          render json: { success: true, message: 'Item deleted successfully' }
        else
          render json: { success: false, errors: item.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_item
        @item = Item.find(params[:id])
      end

      def item_params
        params.permit(:name, :city, :description, :price, :image)
      end
    end
  end
end
