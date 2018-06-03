require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      username: "thuy",
      email: "thuy@email.com"
      # password: "baboon",
      # password_confirmation: "baboon"
    )
  end

  test 'user should be valid' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.username = " "
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = "  "
    assert_not @user.valid?
  end

end
