class V1::CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar_url, :slogan, :description

  has_many :users

  class UserSerializer < ActiveModel::Serializer
    attributes :id, :avatar_url, :first_name, :last_name, :birth_date
  end
end
