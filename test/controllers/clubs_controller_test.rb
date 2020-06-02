require 'test_helper'

class ClubsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get clubs_show_url
    assert_response :success
  end

end
