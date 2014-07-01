class LenderLoanCaseShip < ActiveRecord::Base

	belongs_to :lender
	belongs_to :loan_case

end
