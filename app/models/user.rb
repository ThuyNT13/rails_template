class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[a-z\d]{1}+[\w.+%-]+@[a-z\d]{1}+(?:[a-z\d\-]+\.)+[a-z]{2,}\z/i

  validates :username, :email, presence: true

  validates :username, :email, uniqueness: true

  # FIXME minimum length validation here causes other passing tests to fail in MiniTest
  # validates :username, length: { minimum: 6 }

  validates :password, length: { minimum: 6 }

  validates :username,
    uniqueness: true,
    length: { maximum: 20 }

  validates :email,
    # NOTE does case sensitivity really work here?
    uniqueness: { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX }

    # returns hash digest to be used for setting up fixtures for testing
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt:: Engine.cost
      BCrypt::Password.create(string,cost: cost)
    end
end
