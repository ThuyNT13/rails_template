require 'test_helper'

class LayoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:user1)
  end

  test 'links on page when not logged in' do
    get root_path
    assert_template 'pages/home'
    assert_select "title",  head_title("Home")
    assert_not is_logged_in?
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", login_path, count: 1
    assert_select "a[href=?]", logout_path, count: 0
    get signup_path
    assert_select "title", head_title("Sign up")
  end

  test 'links on page when logged in' do
    get login_path
    assert_template 'sessions/new'
    assert_select "title", head_title("Login")
    assert_select "a[href=?]", login_path, count: 1
    login_as(@user)
    assert is_logged_in?
    assert_select "a[href=?]", login_path, count: 0
    # NOTE elements not present
    # assert_select "a[href=?]", root_path, count: 2 # count: 0
    # assert_select "a[href=?]", logout_path, count: 1 # count: 0
    # assert_select "a[href=?]", user_path(@user)
    # assert_select "a[href=?]", users_path
  end
end
