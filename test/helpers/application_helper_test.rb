require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "head title helper" do
    assert_equal head_title("Home"), "Home | RailsApp"
  end
end
