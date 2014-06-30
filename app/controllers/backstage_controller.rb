class BackstageController < ApplicationController

	def index
		@loan_cases = LoanCase.all
	end

end
