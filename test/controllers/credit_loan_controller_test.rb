require 'test_helper'

class CreditLoanControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get case_detail" do
    get :case_detail
    assert_response :success
  end

  test "should get apply_credit_loan" do
    get :apply_credit_loan
    assert_response :success
  end

end
