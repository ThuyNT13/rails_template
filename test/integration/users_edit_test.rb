require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:user1)
  end

  test "unsuccessful edit" do
    login_as(@user)
    assert is_logged_in?
    get edit_user_path(@user)
    assert_template 'users/edit'
    assert_select "title", head_title("Edit user")
    patch user_path(@user), params: { user: {
      username: '',
      email: '@email.com',
      password: '123456',
      password_confirmation: '654321'
    }}
    assert_select 'div.alert-danger'
    assert_select 'div#error_explanation'
    assert_template 'users/edit'
  end

  test "successful edit" do
    login_as(@user)
    assert is_logged_in?
    # FIXME users#edit no route matches, missing required [:id] keys
    # works fine above, line 12
    get edit_user_path(@suser)
    assert_template 'users/edit'
    usernameEdit = "foo"
    emailEdit = "foo@bar.com"
    patch user_path(@user), params: { user: {
      username: usernameEdit,
      email: emailEdit,
      password: "123456",
      password_confirmation: "123456"
      }}
      assert_not flash.empty?
      @user.reload
      assert_equal usernameEdit, @user.username
      assert_equal emailEdit, @user.email
    end
end
