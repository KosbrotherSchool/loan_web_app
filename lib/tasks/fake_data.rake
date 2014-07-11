namespace :fake_data do

	task :loan_cases => :environment do

		1.upto 5 do |num|
			loan_case = LoanCase.new
			loan_case.is_dealed = true
			loan_case.to_buy_price = 1200
			loan_case.parking_price = 200
			loan_case.to_loan_price = 1000
			loan_case.is_need_grace_period = true
			loan_case.grace_period_years = 2
			loan_case.to_loan_period_years = 20
			loan_case.other_info = "年薪400萬"

			loan_case.address = "台北市中山區一段5號"
			loan_case.layer = 3
			loan_case.building_type = "公寓"
			loan_case.rooms = 3
			loan_case.living_rooms = 2
			loan_case.rest_rooms = 2
			loan_case.building_area = 30
			loan_case.building_age = 25
			loan_case.house_decoration = "無裝潢"
			loan_case.house_condition = "佳，且無滲漏水或壁癌"
			loan_case.is_top_built = true
			loan_case.top_building_area = 30
			loan_case.parking_type = "無"
			loan_case.parking_area = 10

			loan_case.applicant_name = "李先生"
			loan_case.applicant_email = "kerlichung@gmail.com"
			loan_case.applicant_phone = "0933333333"
			loan_case.applicant_age = 20
			loan_case.applicant_company_name = "青青草原"
			loan_case.applicant_title = "經理"
			loan_case.applicant_serve_year = 2
			loan_case.applicant_year_earning = 120
			loan_case.applicant_other_earning = 40
			loan_case.applicant_is_have_house = false
			loan_case.applicant_other_house_loan = 50
			loan_case.applicant_other_credit_loan = 20
			loan_case.is_credit_ok = true
			loan_case.deliver_time = Time.now

			loan_case.county_id = 2
			loan_case.status_id = num
			loan_case.save
		end

	end


	task :lenders => :environment do

			lender = Lender.new
			lender.name = "林先生"
			lender.email = "kerlichung@gmail.com"
			lender.contact_company_phone = "091111111"
			lender.fax_phone = "091111111"
			lender.contact_personal_phone = "091111111"
			lender.bank = "國泰世華"
			lender.bank_branch = "宜蘭分行"
			lender.work_title = "副理"
			lender.save

			lender = Lender.new
			lender.name = "戴先生"
			lender.email = "kosbrotherschool@gmail.com"
			lender.contact_company_phone = "091111111"
			lender.fax_phone = "091111111"
			lender.contact_personal_phone = "091111111"
			lender.bank = "國泰世華"
			lender.bank_branch = "宜蘭分行"
			lender.work_title = "副理"
			lender.save

	end

	task :responses => :environment do

			res = LoanResponse.new
			res.loan_money = 500
			res.loan_years = 20
			res.loan_interest = "2.37%"
			res.interest_explaination = "2.37%一段式"
			res.is_binded = false
			res.grace_period = "20年"
			res.expense_explaination = "5000開辦費"
			res.other_info = "無"
			res.lender_id = 1
			res.loan_case_id = 1
			res.save

			res = LoanResponse.new
			res.loan_money = 500
			res.loan_years = 20
			res.loan_interest = "2.37%"
			res.interest_explaination = "2.37%一段式"
			res.is_binded = false
			res.grace_period = "20年"
			res.expense_explaination = "5000開辦費"
			res.other_info = "無"
			res.lender_id = 1
			res.loan_case_id = 2
			res.save

			res = LoanResponse.new
			res.loan_money = 500
			res.loan_years = 20
			res.loan_interest = "2.37%"
			res.interest_explaination = "2.37%一段式"
			res.is_binded = false
			res.grace_period = "20年"
			res.expense_explaination = "5000開辦費"
			res.other_info = "無"
			res.lender_id = 2
			res.loan_case_id = 1
			res.save
			
	end




end