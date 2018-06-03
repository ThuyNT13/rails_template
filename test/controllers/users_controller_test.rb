require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new routes" do
    get signup_path
    assert_response :success
  end

  test "should get index routes" do
    get users_index_path
    assert_response :success
  end

  test "should get edit routes" do
    get users_edit_path
    assert_response :success
  end

  test "should get show routes" do
    get users_show_path
    assert_response :success
  end

end
