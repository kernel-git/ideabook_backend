# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::UnknownFormat, with: :not_found
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  def not_found
    render json: { status: :not_found, message: 'Not found' }.to_json, status: :not_found
  end

  def not_authorized
    render json: { status: :not_authorized, message: 'You are not authorized for this action' }.to_json, status: :not_authorized
  end
end
