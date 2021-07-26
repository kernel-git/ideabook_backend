# frozen_string_literal: true

class V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :birth_date, :avatar_url, :created_at

  belongs_to :company

  class CompanySerializer < ActiveModel::Serializer
    attributes :id, :avatar_url, :name, :slogan
  end
end
