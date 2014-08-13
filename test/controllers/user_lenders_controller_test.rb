require 'test_helper'

class UserLendersControllerTest < ActionController::TestCase
  test "should get user_center" do
    get :user_center
    assert_response :success
  end

end
