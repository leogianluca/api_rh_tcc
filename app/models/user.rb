class User < ApplicationRecord
  include ::Devise::JWT::RevocationStrategies::JTIMatcher

  # belongs_to :worker
  attr_accessor :jti

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :validatable, :trackable,
      :jwt_authenticatable, jwt_revocation_strategy: self
      # :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  def generate_jwt
    JWT.encode({id: id, exp: 1.year.from_now.to_i}, Rails.application.secrets.secret_key_base)
  end

  def send_password_reset
    raw, hashed = Devise.token_generator.generate(self.class, :reset_password_token)
    self.reset_password_token = hashed
    self.reset_password_sent_at = Time.now.utc
    self.save
    UserMailer&.reset_password(self, raw)&.deliver!
  end
end
