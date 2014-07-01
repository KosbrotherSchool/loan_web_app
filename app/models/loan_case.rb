class LoanCase < ActiveRecord::Base

	has_many :loan_responses
	has_many :lender_loan_case_ships
	has_many :lenders, :through => :lender_loan_case_ships

	# validates :is_dealed, :presence => {:message => "請填入姓名"}

end
