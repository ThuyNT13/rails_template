require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:user1)
  end

  test 'index' do
    login_as(@user)
    get users_path
    assert_template 'users/index'
  end

end
