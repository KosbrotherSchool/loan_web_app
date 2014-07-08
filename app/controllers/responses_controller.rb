class ResponsesController < ApplicationController
  
  def show
  end

  def lender_response
  	@loan_case = LoanCase.find(params[:loan_case_id])
  	# Use key to find lender
  	key = params[:key]
  	@lender = Lender.find(key)
  end

end
