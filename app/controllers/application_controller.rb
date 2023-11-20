# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers['Authorization']
    if header
      token = header.split(' ').last
      begin
        @decoded = JsonWebToken.decode(token)
        @current_user = User.find(@decoded[:user_id]) if @decoded
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
      rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
      end
    else
      render json: { errors: 'Missing token' }, status: :unauthorized
    end
  end
end
