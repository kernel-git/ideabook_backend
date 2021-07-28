# frozen_string_literal: true

class V1::HomeController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_policy_scoped, :only => :index
  skip_after_action :verify_authorized, :except => :index


  def show
    render json: { message: "If you see this, you're in!" }
  end
end
