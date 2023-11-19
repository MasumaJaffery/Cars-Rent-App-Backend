# frozen_string_literal: true

class ItemsController < ApplicationController
  def create
    item = Item.new(item_params)
    if item.save
      render json: { message: 'Item created successfully' }, status: :created
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: { message: 'Item deleted successfully' }, status: :ok
  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end
end
