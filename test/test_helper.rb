ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  def login_as(user)
    sessions[:user_id] = user.id
  end

  def is_logged_in?
    !session[:user_id].nil?
  end

end

class ActionDispatch::IntegrationTest
  def login_as(user, password: 'password')
    post login_path, params: { session: {
      username: user.username,
      password: password
    }}
  end
end
