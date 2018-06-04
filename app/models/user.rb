class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[a-z\d]{1}+[\w.+%-]+@[a-z\d]{1}+(?:[a-z\d\-]+\.)+[a-z]{2,}\z/i

  validates :username, :email, :password, presence: true

  validates :username, :email, uniqueness: true

  # FIXME minimum length validation causes other passing tests to fail in MiniTest
  # not so with password length validation
  # validates :username, length: { minimum: 6 }

  validates :username,
    uniqueness: true,
    length: { maximum: 20 }

  validates :email,
    # NOTE does case sensitivity really work here?
    uniqueness: { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX }

  validates :password, length: { minimum: 6 }

end
