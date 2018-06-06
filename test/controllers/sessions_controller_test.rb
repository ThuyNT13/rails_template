require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should get new session form" do
    get login_path
    assert_select "title", head_title("Login")
    assert_select 'form[action=?]', '/login'
    assert_response :success
  end
end
