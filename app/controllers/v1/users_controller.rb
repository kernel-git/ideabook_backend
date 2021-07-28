# frozen_string_literal: true

class V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = policy_scope(User.all)
    render json: @users, include: ''
  end

  def show
    @user ||= authorize User.find(params[:id])
    render json: @user
  end

  def update
    @user ||= authorize User.find(params[:id])
    @user.update!(user_params)
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :birth_date,
      :avatar_url,
      :password,
      :password_confirmation
    )
  end
end
