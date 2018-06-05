require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

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
