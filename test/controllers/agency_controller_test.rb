require 'test_helper'

class AgencyControllerTest < ActionController::TestCase
  test "should get agencies" do
    get :agencies
    assert_response :success
  end

end
