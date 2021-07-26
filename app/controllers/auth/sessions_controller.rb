# frozen_string_literal: true

class Auth::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    resource.persisted? ? log_in_success : log_in_failure
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_in_success
    render json: { message: 'You are logged in.', user_id: current_user.id }, status: :ok
  end

  def log_in_failure
    render json: { message: 'Log in failed.' }, status: :unauthorized
  end

  def log_out_success
    render json: { message: 'You are logged out.' }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Log out failed.' }, status: :unauthorized
  end
end
