class UserLendersController < ApplicationController
	before_filter :authenticate_user_lender!

  def user_center
  end

end

