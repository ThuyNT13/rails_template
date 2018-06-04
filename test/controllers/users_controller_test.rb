require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.new(username: "Example User", email: "user@example.com")
  end

  test "should get new routes" do
    get signup_path
    assert_response :success
  end

  test "should get index routes" do
    get users_path
    assert_response :success
  end

  # test "should get edit routes" do
  #   get edit_user_path(@user)
  #   assert_response :success
  # end
  #
  # test "should get show routes" do
  #   get user_path(@user)
  #   assert_response :success
  # end

end
