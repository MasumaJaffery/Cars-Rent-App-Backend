module Api
  module V1
    class ReservationsController < ApplicationController
      load_and_authorize_resource
      before_action :set_reservation, only: %i[show destroy]

      # GET
      def index
        @reservations = Reservation.all
        render json: @reservations
      end

      def show
        render json: @reservation
      end

      def create
        @reservation = Reservation.new(reservation_params)

        if current_user
          @reservation.user_id = current_user.id

          if @reservation.save
            render json: @reservation, status: :created
          else
            render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { errors: ['User not authenticated'] }, status: :unauthorized
        end
      end

      def destroy
        if @reservation.destroy
          render json: { success: true, message: 'Reservation deleted' }
        else
          render json: { success: false, errors: @reservation.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_reservation
        @reservation = Reservation.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def reservation_params
        params.require(:reservation).permit(:car_id, :date, :city)
      end
    end
  end
end
