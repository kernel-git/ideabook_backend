class V1::CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :avatar_url, :slogan, :description
end
