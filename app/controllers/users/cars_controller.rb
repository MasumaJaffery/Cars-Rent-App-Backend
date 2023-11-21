# frozen_string_literal: true
module Api
    module V1
      class CarsController < ApplicationController
        before_action :authenticate_user!
        def index
          @cars = Car.all
          render json: @cars
        end
        def show
          render json: @car
        end
        def create
          # Example debugging in Api::V1::CarsController#create
          puts "Current User: #{current_user.inspect}"
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
        # Use callbacks to share common setup or constraints between actions.
        def set_car
          @car = Car.find(params[:id])
        end
        # Only allow a list of trusted parameters through.
        def car_params
          params.require(:car).permit(:name, :description, :category, :added_by)
        end
      end
    end
  
    