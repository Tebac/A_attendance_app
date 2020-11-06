require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get schedules_edit_url
    assert_response :success
  end

end
