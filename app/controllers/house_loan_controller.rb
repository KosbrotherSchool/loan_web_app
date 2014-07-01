class HouseLoanController < ApplicationController

	def index		
	end

	def new
	end

	def apply_mortgage
		if params[:msg] == 'success'
			
		else
			@loan_case = LoanCase.new
		end
	end

	def create_loan_case
		@loan_case = LoanCase.new(loan_case_params)

		@loan_case.address = params[:county] + params[:district] + @loan_case.address
		
		County.all.each do |county|
			county_s = county.name[0..1]
			if condition
				
			end
		end

		applicant_company_type = ""
		if params[:company_type_1][:value] != "" 
			applicant_company_type = params[:company_type_1][:value] 
		end

		if params[:company_type_2][:value] != ""
			if applicant_company_type == ""
				applicant_company_type = params[:company_type_2][:value]
			else
				applicant_company_type = applicant_company_type + "," + params[:company_type_2][:value]
			end
		end

		if params[:company_type_3][:value] != ""
			if applicant_company_type == ""
				applicant_company_type = params[:company_type_3][:value]
			else
				applicant_company_type = applicant_company_type + "," + params[:company_type_3][:value]
			end
		end
		@loan_case.applicant_company_type = applicant_company_type

		if @loan_case.save
			# push_loan_case_to_gdoc(@loan_case.is_dealed, @loan_case.to_buy_price, @loan_case.parking_price, @loan_case.to_loan_price, @loan_case.is_need_grace_period, @loan_case.grace_period_years, @loan_case.to_loan_period_years, @loan_case.other_info, @loan_case.address, @loan_case.layer, @loan_case.building_type, @loan_case.rooms, @loan_case.living_rooms, @loan_case.rest_rooms, @loan_case.building_area, @loan_case.public_area, @loan_case.land_area, @loan_case.building_age, @loan_case.house_decoration, @loan_case.house_condition, @loan_case.is_top_built, @loan_case.top_building_area, @loan_case.parking_type, @loan_case.parking_layer, @loan_case.parking_area, @loan_case.applicant_name, @loan_case.applicant_email, @loan_case.applicant_phone1, @loan_case.applicant_phone2, @loan_case.applicant_age, @loan_case.applicant_company_name, @loan_case.is_applicant_company_founder, @loan_case.applicant_title, @loan_case.applicant_serve_year, @loan_case.applicant_year_earning, @loan_case.applicant_other_earning, @loan_case.applicant_company_type, @loan_case.applicant_is_have_house, @loan_case.applicant_other_house_loan, @loan_case.applicant_other_car_loan, @loan_case.applicant_other_learning_loan, @loan_case.is_applicant_use_revolving_interest, @loan_case.is_applicant_use_check, @loan_case.is_applicant_have_bounce_check)
			ConfirmMailer.mail_content(@loan_case.id).deliver
			Lender.all.each do |lender|
				MailToLenderMailer.mail_content(@loan_case.id, lender.email).deliver
			end
			redirect_to :controller => 'house_loan', :action => 'apply_mortgage', :msg => 'success'
		else
			render :apply_mortgage
		end
	end

	def join_us
		if params[:msg] == 'success'
			
		else
			@lender = Lender.new
		end
	end

	def create_lender
		@lender = Lender.new(lender_params)
		if @lender.save
			
			if params[:taipei] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 2
				lenderCountyShip.save
			end

			if params[:new_taipei] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 3
				lenderCountyShip.save
			end

			if params[:keelung] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 1
				lenderCountyShip.save
			end

			if params[:taoyuan] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 4
				lenderCountyShip.save
			end

			if params[:hsinchu] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 5
				lenderCountyShip.save
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 6
				lenderCountyShip.save
			end

			if params[:miaoli] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 7
				lenderCountyShip.save
			end

			if params[:taichung] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 8
				lenderCountyShip.save
			end

			if params[:changhua] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 10
				lenderCountyShip.save
			end

			if params[:nantao] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 9
				lenderCountyShip.save
			end

			if params[:yunlin] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 11
				lenderCountyShip.save
			end

			if params[:jiayi] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 12
				lenderCountyShip.save
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 13
				lenderCountyShip.save
			end

			if params[:tainan] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 14
				lenderCountyShip.save
			end

			if params[:kaohsiung] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 15
				lenderCountyShip.save
			end

			if params[:pingtung] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 16
				lenderCountyShip.save
			end

			if params[:yilan] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 17
				lenderCountyShip.save
			end

			if params[:hualian] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 18
				lenderCountyShip.save
			end

			if params[:taidong] == "true"
				lenderCountyShip = LenderCountyShip.new
				lenderCountyShip.lender_id = @lender.id
				lenderCountyShip.county_id = 19
				lenderCountyShip.save
			end



			# push_lender_data_to_gdoc(lender_params[:name],lender_params[:email],lender_params[:contact_company_phone],lender_params[:fax_phone],lender_params[:contact_personal_phone],lender_params[:bank],lender_params[:bank_branch],lender_params[:work_title])
			redirect_to :controller => 'house_loan', :action => 'join_us', :msg => 'success'
		else
			render :join_us
		end
		
		# params[:taipei]
		
	end

	def about_us	
	end

	def faq	
	end

	def term	
	end

	def privacy	
	end

	private 

	def to_boolean(str)
      str == 'true'
  end

	def lender_params
		params.require(:lender).permit(:name,:email,:contact_company_phone, :fax_phone, :contact_personal_phone, :bank, :bank_branch, :work_title, :avatar, :card)
	end

	def loan_case_params
		params.require(:loan_case).permit(:is_dealed, :is_need_grace_period, :to_loan_period_years, :to_buy_price,:parking_price, :to_loan_price, :grace_period_years, :other_info, :address, :layer, :building_type, :rooms, :living_rooms, :rest_rooms, :building_area, :public_area, :land_area, :building_age, :house_decoration, :house_condition, :is_top_built,:top_building_area,:parking_type, :parking_layer, :parking_area, :applicant_name, :applicant_email, :applicant_phone1, :applicant_phone2, :applicant_age, :applicant_company_name, :is_applicant_company_founder, :applicant_title, :applicant_serve_year, :applicant_year_earning, :applicant_other_earning, :applicant_is_have_house,:applicant_other_house_loan, :applicant_other_credit_loan, :applicant_other_car_loan, :applicant_other_learning_loan, :is_applicant_use_revolving_interest, :is_applicant_use_check, :is_applicant_have_bounce_check)
	end

	def push_loan_case_to_gdoc(is_dealed, to_buy_price, parking_price, to_loan_price, is_need_grace_period, grace_period_years, to_loan_period_years, other_info,address, layer, building_type, rooms, living_rooms, rest_rooms, building_area, public_area, land_area, building_age, house_decoration, house_condition, is_top_built, top_building_area, parking_type, parking_layer, parking_area, applicant_name,applicant_email, applicant_phone1, applicant_phone2, applicant_age, applicant_company_name, is_applicant_company_founder, applicant_title, applicant_serve_year, applicant_year_earning, applicant_other_earning, applicant_company_type, applicant_is_have_house, applicant_other_house_loan, applicant_other_credit_loan, applicant_other_learning_loan, is_applicant_use_revolving_interest, is_applicant_use_check, is_applicant_have_bounce_check)
		session = GoogleDrive.login(ENV["GMAIL_USERNAME"], ENV["GMAIL_SECRET"])
		ws = session.spreadsheet_by_key(ENV["TABLE_LOAN_CASE"]).worksheets[0]	
		num_rows = ws.num_rows + 1
		ws[num_rows,1] = is_dealed
		ws[num_rows,2] = to_buy_price
		ws[num_rows,3] = parking_price
		ws[num_rows,4] = to_loan_price
		ws[num_rows,5] = is_need_grace_period
		ws[num_rows,6] = grace_period_years
		ws[num_rows,7] = to_loan_period_years
		ws[num_rows,8] = other_info
		ws[num_rows,9] = address
		ws[num_rows,10] = layer
		ws[num_rows,11] = building_type
		ws[num_rows,12] = rooms
		ws[num_rows,13] = living_rooms
		ws[num_rows,14] = rest_rooms
		ws[num_rows,15] = building_area
		ws[num_rows,16] = public_area
		ws[num_rows,17] = land_area
		ws[num_rows,18] = building_age
		ws[num_rows,19] = house_decoration
		ws[num_rows,20] = house_condition
		ws[num_rows,21] = is_top_built
		ws[num_rows,22] = top_building_area
		ws[num_rows,23] = parking_type
		ws[num_rows,24] = parking_layer
		ws[num_rows,25] = parking_area
		ws[num_rows,26] = applicant_name
		ws[num_rows,27] = applicant_email
		ws[num_rows,28] = applicant_phone1
		ws[num_rows,29] = applicant_phone2
		ws[num_rows,30] = applicant_age
		ws[num_rows,31] = applicant_company_name
		ws[num_rows,32] = is_applicant_company_founder
		ws[num_rows,33] = applicant_title
		ws[num_rows,34] = applicant_serve_year
		ws[num_rows,35] = applicant_year_earning
		ws[num_rows,36] = applicant_other_earning
		ws[num_rows,37] = applicant_company_type
		ws[num_rows,38] = applicant_is_have_house
		ws[num_rows,39] = applicant_other_house_loan
		ws[num_rows,40] = applicant_other_credit_loan
		ws[num_rows,41] = applicant_other_learning_loan
		ws[num_rows,42] = is_applicant_use_revolving_interest
		ws[num_rows,43] = is_applicant_use_check
		ws[num_rows,44] = is_applicant_have_bounce_check
		ws.save()
	end

	def push_lender_data_to_gdoc(name, email, company_phone, fax_phone, personal_phone, bank, bank_branch, work_title)
		session = GoogleDrive.login(ENV["GMAIL_USERNAME"], ENV["GMAIL_SECRET"])
		ws = session.spreadsheet_by_key(ENV["TABLE_LENDER"]).worksheets[0]	
		num_rows = ws.num_rows + 1
		ws[num_rows,1] = name
		ws[num_rows,2] = email
		ws[num_rows,3] = company_phone
		ws[num_rows,4] = fax_phone
		ws[num_rows,5] = personal_phone
		ws[num_rows,6] = bank
		ws[num_rows,7] = bank_branch
		ws[num_rows,8] = work_title
		ws.save()
	end

end
