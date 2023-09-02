require "test_helper"

class TopPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get top_pages_top_url
    assert_response :success
  end
end
