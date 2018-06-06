require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:user1)
  end

  test 'should get users list when logged in' do
    login_as(@user)
    get users_path
    assert_template 'users/index'
    assert_select "title",  head_title("Members")
    assert_response :success
  end

  test 'should not get users list when not logged in' do
    get users_path
    assert_not is_logged_in?
    assert_not flash.empty?
    assert_redirected_to login_url
    follow_redirect!
    assert_template 'sessions/new'
    assert_select "title", head_title("Login")
    assert_select 'form[action=?]', '/login'
  end

end
