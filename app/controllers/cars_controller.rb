module Api
  module V1
    class CarsController < ApplicationController
      def index
        @cars = Car.all
        render json: @cars
      end

      # Implement other CRUD actions
    end
  end
end
