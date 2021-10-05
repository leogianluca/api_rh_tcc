class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::Allowlist

  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable, :trackable,
      :jwt_authenticatable, jwt_revocation_strategy: self
      # :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
end