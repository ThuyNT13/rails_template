require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:user1)
  end

  test 'should get users list with login' do
    login_as(@user)
    get users_path
    assert_template 'users/index'
    assert_select "title",  head_title("Members")
    assert_response :success
  end

end
