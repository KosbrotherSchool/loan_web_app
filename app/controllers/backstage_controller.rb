class BackstageController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		@loan_cases = LoanCase.all
	end

	def deliver_mail
		ff
	end

end
