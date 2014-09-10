require 'test_helper'

class KnowledgeControllerTest < ActionController::TestCase
  test "should get knowledges" do
    get :knowledges
    assert_response :success
  end

  test "should get home_loan_knowledge" do
    get :home_loan_knowledge
    assert_response :success
  end

  test "should get credit_loan_knowledge" do
    get :credit_loan_knowledge
    assert_response :success
  end

  test "should get car_loan_knowledge" do
    get :car_loan_knowledge
    assert_response :success
  end

  test "should get integrate_knowledge" do
    get :integrate_knowledge
    assert_response :success
  end

end
