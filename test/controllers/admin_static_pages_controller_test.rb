require 'test_helper'

class AdminStaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_static_pages_index_url
    assert_response :success
  end

end
