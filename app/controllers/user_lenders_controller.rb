class UserLendersController < ApplicationController
	before_filter :authenticate_user_lender!

  def user_center
  	@lender = Lender.find(params[:lender_id])
  end

  def user_cases
  	@lender = Lender.find(params[:lender_id])
  end

end

