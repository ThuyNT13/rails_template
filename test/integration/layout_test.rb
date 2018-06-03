require 'test_helper'

class LayoutTest < ActionDispatch::IntegrationTest
  test 'header links' do
    get root_path
    assert_template 'pages/home'
    assert_select "a[href=?]", root_path, count: 1
    assert_select "title",  head_title("Home")

    get signup_path
    assert_template 'users/new'
    assert_select "title", head_title("Sign up")
  end
end
