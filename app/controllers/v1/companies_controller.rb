# frozen_string_literal: true

class V1::CompaniesController < ApplicationController
  before_action :authenticate_user!

  def index
    @companies = Company.all

    render json: @companies
  end

  def show
    @company ||= Company.find(params[:id])

    render json: @company
  end

  def update
    @company ||= Company.find(params[:id])

    @company.update!(company_params)
    render json: @company
  end

  private

  def company_params
    params.require(:company).permit(
      :name,
      :avatar_url,
      :slogan,
      :description
    )
  end
end
