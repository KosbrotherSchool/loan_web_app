namespace :fake_data do

	task :loan_cases => :environment do

		loan_case = LoanCase.new
		loan_case.is_deaded = true
		loan_case.to_buy_price = 1200
		loan_case.parking_price = 1200
		loan_case.to_loan_price = 1200
		loan_case.is_need_grace_period = 1200
		loan_case.grace_period_years = 1200
		loan_case.to_loan_period_years = 1200
		loan_case.other_info = 1200



	end


end