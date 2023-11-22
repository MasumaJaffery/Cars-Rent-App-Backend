# frozen_string_literal: true

module Api
  module V1
    class CarsController < ApplicationController
      before_action :authenticate_user!, except: %i[index show]
      before_action :set_car, only: %i[show destroy]

      def index
        @cars = Car.all
        render json: @cars
      end

      def show
        render json: @car
      end

      def create
        @car = current_user.cars.build(car_params)
        if @car.save
          render json: @car, status: :created
        else
          render json: { error: @car.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @car.destroy
          render json: { success: true, message: 'Car deleted' }
        else
          render json: { success: false, errors: @car.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_car
        @car = Car.find(params[:id])
      end

      def car_params
        params.require(:car).permit(:name, :description, :category, :added_by)
      end
    end
  end
end
