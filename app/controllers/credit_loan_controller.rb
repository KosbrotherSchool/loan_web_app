class CreditLoanController < ApplicationController
  def create
  end

  def case_detail
  end

  def apply_credit_loan
  	if params[:msg] == 'success'
			
		else
			@loan_case = LoanCase.new
		end
  end
end
