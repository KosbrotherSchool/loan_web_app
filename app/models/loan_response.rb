class LoanResponse < ActiveRecord::Base

	belongs_to :lender
	belongs_to :loan_case
	
	validates :loan_money, :presence => {:message => "請填寫可貸款金額"}
	validates :loan_years, :presence => {:message => "請填寫貸款年限"}
	validates :grace_period, :presence => {:message => "請填寫寬限期"}
	validates :interest_explaination, :presence => {:message => "請填寫利率說明"}
	validates :expense_explaination, :presence => {:message => "請填寫費用說明"}
	
end
