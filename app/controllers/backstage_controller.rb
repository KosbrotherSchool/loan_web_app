class BackstageController < ApplicationController
	before_filter :authenticate_user!, :check_user
	
	def index
		@loan_cases = LoanCase.all
	end

	def deliver_mail
		loan_case = LoanCase.find(params[:key])
		loan_case.deliver_time = Time.now
		loan_case.status_id = 2
		loan_case.save

		# deliver reply mail
		ReplyApplierMailer.delay.mail_content(loan_case.id)

		redirect_to :controller => 'backstage', :action => 'index'
	end

	def update_evaluate_case
		loan_case = LoanCase.find(params[:key])
		loan_case.notes = params[:loan_case][:notes]
		loan_case.status_id = getStausIdByName(params[:loan_case][:status])
		loan_case.save
		redirect_to :controller => 'backstage', :action => 'index'
	end

	def update_delivering_case
		loan_case = LoanCase.find(params[:key])
		loan_case.notes = params[:loan_case][:notes]
		loan_case.status_id = getStausIdByName(params[:loan_case][:status])
		loan_case.lender_id = params[:loan_case][:lender_id]
		loan_case.save
		redirect_to :controller => 'backstage', :action => 'index'
	end

	def update_loaning_case
		loan_case = LoanCase.find(params[:key])
		loan_case.notes = params[:loan_case][:notes]
		loan_case.status_id = getStausIdByName(params[:loan_case][:status])
		loan_case.save
		redirect_to :controller => 'backstage', :action => 'index'
	end

	def update_loanded_case
		loan_case = LoanCase.find(params[:key])
		loan_case.notes = params[:loan_case][:notes]
		loan_case.status_id = getStausIdByName(params[:loan_case][:status])
		loan_case.is_charged = checkTrueFalseByName(params[:loan_case][:is_charged])
		loan_case.is_feedbacked = checkTrueFalseByName(params[:loan_case][:is_feedbacked])
		loan_case.save
		redirect_to :controller => 'backstage', :action => 'index'
	end

	def update_failed_case
		loan_case = LoanCase.find(params[:key])
		loan_case.notes = params[:loan_case][:notes]
		loan_case.status_id = getStausIdByName(params[:loan_case][:status])
		loan_case.save
		redirect_to :controller => 'backstage', :action => 'index'
	end


	def onlendings
		@onlendings = Onlending.all
	end

	def deliver_onlending_mail
		onlending = Onlending.find(params[:key])
		onlending.deliver_time = Time.now
		onlending.status_id = 2
		onlending.save

		# deliver reply mail
		# ReplyApplierMailer.delay.mail_content(loan_case.id)

		redirect_to root_path+"backstage/onlendings"
	end

	def update_evaluate_onlending
		onlending = Onlending.find(params[:key])
		onlending.notes = params[:loan_case][:notes]
		onlending.status_id = getStausIdByName(params[:loan_case][:status])
		onlending.save
		redirect_to root_path+"backstage/onlendings"
	end

	def lenders
		@lenders = Lender.all
	end

	def lenders_update_lender
		lender = Lender.find(params[:lender][:id])
		lender.is_show = checkTrueFalseByName(params[:lender][:is_show])
		lender.is_person_confirmed = checkTrueFalseByName(params[:lender][:is_person_confirmed])
		lender.save
		lender.update(lender_avatar_params)
		redirect_to backstage_lenders_path
	end

	def loan_case_detail
		@loan_case = LoanCase.find(params[:loan_case_id])
		@lenders = Lender.joins(:lender_county_ships).where("county_id = #{@loan_case.county_id}")
		# @lenders = Lender.joins(:lender_loan_case_ships).where("loan_case_id = #{@loan_case.id}")
	end

	def loan_case_detail_edit
		@loan_case = LoanCase.find(params[:loan_case_id])
	end

	def loan_case_detail_update
		loan_case = LoanCase.find(params[:loan_case_id])
		loan_case.update(loan_case_params)
		redirect_to :controller => 'backstage', :action => 'loan_case_detail'
	end

	def county_lenders
		@county = County.find(params[:county_id])
		@lenders = @county.lenders
	end

	def mail_to_lenders	
		@loan_case = LoanCase.find(params[:loan_case_id])
		@loan_case.is_mailed_lenders = true
		@loan_case.save

		Lender.joins(:lender_county_ships).where("county_id = #{@loan_case.county_id} and is_person_confirmed = true").each do |lender|
			MailToLenderMailer.delay.mail_content(@loan_case.id, lender.id)
			lenderLoanCaseShip = LenderLoanCaseShip.new
			lenderLoanCaseShip.lender_id = lender.id
			lenderLoanCaseShip.loan_case_id = @loan_case.id
			lenderLoanCaseShip.save
		end

		redirect_to :controller => 'backstage', :action => 'index'
	end

	def mail_to_the_lender
		loan_case = LoanCase.find(params[:loan_case_id])
		lender = Lender.find(params[:lender_id])

		if LenderLoanCaseShip.where("lender_id=#{lender.id}  and loan_case_id = #{loan_case.id}").first == nil
			lenderLoanCaseShip = LenderLoanCaseShip.new
			lenderLoanCaseShip.lender_id = lender.id
			lenderLoanCaseShip.loan_case_id = loan_case.id
			lenderLoanCaseShip.save
		end
		MailToLenderMailer.delay.mail_content(loan_case.id, lender.id)

		redirect_to :controller => 'backstage', :action => 'loan_case_detail'
	end

	def lender_edit
		@lender = Lender.find(params[:lender_id])
	end

	def update_lender
		lender = Lender.find(params[:lender_id])
		lender.update(lender_params)
		County.all.each do |county|
			if params["county_#{county.id}"]
				if LenderCountyShip.where("lender_id = #{lender.id} and county_id = #{county.id}").size() == 0
					lenderCountyShip = LenderCountyShip.new
					lenderCountyShip.lender_id = lender.id
					lenderCountyShip.county_id = county.id
					lenderCountyShip.save
				end
			else
				if LenderCountyShip.where("lender_id = #{lender.id} and county_id = #{county.id}").size() != 0
					lenderCountyShip = LenderCountyShip.where("lender_id = #{lender.id} and county_id = #{county.id}").first
					lenderCountyShip.delete
				end
			end
		end
		redirect_to root_path+"backstage/lenders/#{lender.id}"
	end

	private 

	def check_user
		if !(current_user.id <= 3)
			redirect_to root_path
		end
	end

	def getStausIdByName(status_string)
		CaseStatus.all.each do |case_status|
			if case_status.name ==  status_string
				return case_status.id
			end
		end
	end

	def checkTrueFalseByName(string)
		if string == "是"
			return true
		else
			return false
		end
	end

	def lender_avatar_params
		params.require(:lender).permit(:avatar, :email)
	end

	def lender_params
		params.require(:lender).permit(:name,:email,:contact_company_phone, :fax_phone, :contact_personal_phone, :bank, :bank_branch, :work_title, :avatar, :card, :is_male)
	end

	def loan_case_params
		params.require(:loan_case).permit(:is_dealed, :is_need_grace_period, :to_loan_period_years, :to_buy_price,:parking_price, :to_loan_price, :grace_period_years, :other_info, :address, :layer, :building_type, :rooms, :living_rooms, :rest_rooms, :building_area, :building_age, :house_decoration, :house_condition, :is_top_built,:top_building_area,:parking_type, :parking_layer, :parking_area, :applicant_name, :applicant_email, :applicant_phone, :applicant_age, :applicant_company_name, :applicant_title, :applicant_serve_year, :applicant_year_earning, :applicant_other_earning, :applicant_is_have_house,:applicant_other_house_loan, :applicant_other_credit_loan, :is_credit_ok)
	end

end
