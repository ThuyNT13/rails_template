require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:user1)
  end

  test "valid login" do
    get login_path
    assert_template 'sessions/new'
    assert_select "title",  head_title("Login")
    assert_select 'form[action=?]', '/login'
    login_as(@user)
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template "users/show"
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    assert is_logged_in?
  end

  test "invalid login" do
    get login_path
    assert_template 'sessions/new'
    assert_select "title",  head_title("Login")
    assert_select 'form[action=?]', '/login'
    post login_path, params: { session: { email: "", password: "" } }
    assert_not is_logged_in?
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "valid login followed by logout" do
    get login_path
    assert_template 'sessions/new'
    assert_select "title",  head_title("Login")
    assert_select 'form[action=?]', '/login'
    post login_path, params: { session: {
      username: @user.username,
      password: 'password'
      }}
    assert is_logged_in?
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
end
