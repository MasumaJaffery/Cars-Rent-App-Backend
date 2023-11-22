class CurrentUserController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: { status: 'SUCCESS', message: 'Deleted user', data: @user }, status: :ok
    else
      render json: { status: 'ERROR', message: 'User not deleted', data: @user.errors },
             status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :id, :email)
  end
end
