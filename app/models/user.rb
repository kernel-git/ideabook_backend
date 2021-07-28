# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
  belongs_to :company

  enum role: [:user, :admin, :superadmin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end
end
