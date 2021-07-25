class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::UnknownFormat, with: :not_found

  def not_found
    render json: { status: '404', message: 'Not found' }.to_json, status: :not_found
  end
end
