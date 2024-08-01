require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get terms_of_service" do
    get static_pages_terms_of_service_url
    assert_response :success
  end
end
