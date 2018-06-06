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
    # assert_response :success
    assert_redirected_to login_url
  end

  # FIXME no route matches to users#edit/users#show
  # ActionController::UrlGenerationError...missing required keys [:id]
  test "should get show routes" do
    get user_path(@user)
    # assert_response :success
  end

  test "should get edit routes" do
    get edit_user_path(@user)
    # assert_response :success
  end

  # test 'should redirect edit when not logged in' do
  #   get edit_user_path(@user)
  #   assert_not flash.empty?
  #   assert_redirected_to login_url
  # end
  #
  # test "should redirect update when not logged in" do
  #   patch user_path(@user), params: { user: {
  #     username: @user.username,
  #     email: @user.email
  #   } }
  #   assert_not flash.empty?
  #   assert_redirected_to login_url
  # end

  test 'should destroy user' do
    assert_difference 'User.count', -1 do
      delete user_path(@user)
    end
  end
end
