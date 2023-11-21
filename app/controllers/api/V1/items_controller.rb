# frozen_string_literal: true

class Api::V1::ItemsController < ApplicationController
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
  
    def show
      item = Item.find(params[:id])
      render json: item
    end
  
    def create
      item = Item.new(item_params)
      if item.save
        render json: item, status: :created
      else
        render json: { errors: item.errors }, status: :unprocessable_entity
      end
    end
  
    private
  
    def item_params
      params.permit(:name, :city, :description, :price, :image)
    end
  end
  