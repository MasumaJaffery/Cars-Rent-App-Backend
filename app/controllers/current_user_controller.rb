class CurrentUserController < ApplicationController
  before_action :authenticate_user!

  def show
    render json: current_user, status: :ok
  end

  def update
    if current_user.update(user_params)
      render json: current_user, status: :ok
    else
      render json: { errors: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email) # Adjust attributes as needed
  end
end
