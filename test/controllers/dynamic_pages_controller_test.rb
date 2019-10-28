require 'test_helper'

class DynamicPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get dynamic_pages_contact_url
    assert_response :success
  end

end
