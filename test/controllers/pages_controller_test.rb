require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "RailsApp"
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select 'title', "Home | #{@base_title}"
  end

end
