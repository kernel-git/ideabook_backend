# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
  belongs_to :company
end
