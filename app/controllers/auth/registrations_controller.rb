# frozen_string_literal: true

class Auth::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  skip_after_action :verify_policy_scoped, :only => :index
  skip_after_action :verify_authorized, :except => :index

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: { message: 'Signed up sucessfully.' }
  end

  def register_failed
    render json: { message: 'Sign up failed.' }
  end
end
