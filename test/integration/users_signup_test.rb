require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "valid signup" do
    get signup_path
    assert_difference 'User.count', 1 do
      post signup_path, params: { user: {
        username: "jorge-g",
        email: "jorge@email.com",
        password: "georgie",
        password_confirmation: "georgie"
      }}
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
  end

  test "invalid signup" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params: { user: {
        username: "",
        email: "bette@email",
        password: "georgie",
        password_confirmation: "giorgio"
      }}
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
    assert_select 'form[action=?]', '/signup'
  end


end
