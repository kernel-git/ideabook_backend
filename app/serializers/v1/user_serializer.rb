class V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :birth_date, :avatar_url, :created_at
end
