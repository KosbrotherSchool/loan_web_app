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

		OnlendingReplyApplierMailer.delay.mail_content(onlending.id)

		redirect_to root_path+"backstage/onlendings"
	end

	def update_evaluate_onlending
		onlending = Onlending.find(params[:key])
		onlending.notes = params[:onlending][:notes]
		onlending.status_id = getStausIdByName(params[:onlending][:status])
		onlending.save
		redirect_to root_path+"backstage/onlendings"
	end


	def update_delivering_onlending
		onlending = Onlending.find(params[:key])
		onlending.notes = params[:onlending][:notes]
		onlending.status_id = getStausIdByName(params[:onlending][:status])
		onlending.lender_id = params[:onlending][:lender_id]
		onlending.save
		redirect_to root_path+"backstage/onlendings"
	end

	def update_loaning_onlending
		loan_case = Onlending.find(params[:key])
		loan_case.notes = params[:onlending][:notes]
		loan_case.status_id = getStausIdByName(params[:onlending][:status])
		loan_case.save
		redirect_to root_path+"backstage/onlendings"
	end

	def update_loanded_onlending
		onlending = Onlending.find(params[:key])
		onlending.notes = params[:onlending][:notes]
		onlending.status_id = getStausIdByName(params[:onlending][:status])
		onlending.is_charged = checkTrueFalseByName(params[:onlending][:is_charged])
		onlending.is_feedbacked = checkTrueFalseByName(params[:onlending][:is_feedbacked])
		onlending.save
		redirect_to root_path+"backstage/onlendings"
	end

	def update_failed_onlending
		onlending = Onlending.find(params[:key])
		onlending.notes = params[:onlending][:notes]
		onlending.status_id = getStausIdByName(params[:onlending][:status])
		onlending.save
		redirect_to root_path+"backstage/onlendings"
	end

	def onlending_detail
		@onlending = Onlending.find(params[:onlending_id])
		@lenders = Lender.joins(:lender_county_ships).where("county_id = #{@onlending.county_id}")
	end

	def onlending_detail_edit
		@onlending = Onlending.find(params[:onlending_id])
	end

	def onlending_update_time
		@onlending = Onlending.find(params[:onlending_id])
		begin
			ymdArray = params[:yymmdd].split("-")
			hhmmArray = params[:hhmm].split(":")
			@onlending.dead_time = Time.new(ymdArray[0], ymdArray[1], ymdArray[2],hhmmArray[0],hhmmArray[1])
			@onlending.save
		rescue Exception => e
			
		end	
		redirect_to :controller => 'backstage', :action => 'onlending_detail'
	end

	def onlending_detail_update
		@onlending = Onlending.find(params[:onlending_id])
		@onlending.update(onlending_params)
		redirect_to :controller => 'backstage', :action => 'onlending_detail'
	end
	
	def onlending_mail_to_lenders
		@onlending = Onlending.find(params[:onlending_id])
		@onlending.is_mailed_lenders = true
		@onlending.save

		Lender.joins(:lender_county_ships).where("county_id = #{@onlending.county_id} and is_person_confirmed = true").each do |lender|
			OnlendingMailToLenderMailer.delay.mail_content(@onlending.id, lender.id)
			lenderOnlendingShip = LenderOnlendingShip.new
			lenderOnlendingShip.lender_id = lender.id
			lenderOnlendingShip.onlending_id = @onlending.id
			lenderOnlendingShip.save
		end

		redirect_to :controller => 'backstage', :action => 'onlending_detail'
	end

	def onlending_mail_to_the_lender
		onlending = Onlending.find(params[:onlending_id])
		lender = Lender.find(params[:lender_id])

		if LenderOnlendingShip.where("lender_id=#{lender.id}  and onlending_id = #{onlending.id}").first == nil
			lenderOnlendingShip = LenderOnlendingShip.new
			lenderOnlendingShip.lender_id = lender.id
			lenderOnlendingShip.onlending_id = onlending.id
			lenderOnlendingShip.save
		end
		OnlendingMailToLenderMailer.delay.mail_content(onlending.id, lender.id)

		redirect_to :controller => 'backstage', :action => 'onlending_detail'
	end

	def loan_case_detail
		@loan_case = LoanCase.find(params[:loan_case_id])
		@lenders = Lender.joins(:lender_county_ships).where("county_id = #{@loan_case.county_id}")
	end

	def loan_case_detail_edit
		@loan_case = LoanCase.find(params[:loan_case_id])
	end

	def loan_case_update_time
		@loan_case = LoanCase.find(params[:loan_case_id])
		begin
			ymdArray = params[:yymmdd].split("-")
			hhmmArray = params[:hhmm].split(":")
			@loan_case.dead_time = Time.new(ymdArray[0], ymdArray[1], ymdArray[2],hhmmArray[0],hhmmArray[1])
			@loan_case.save
		rescue Exception => e
			
		end
		redirect_to :controller => 'backstage', :action => 'loan_case_detail'
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

		redirect_to root_path + "backstage/loan_cases/#{@loan_case.id}"
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

	def banks
		@banks = Bank.all
	end

	def bank_product_edit
		@bank_product = BankProduct.find(params[:bank_product_id])
	end

	def bank_product_update
		bank_product = BankProduct.find(params[:bank_product_id])
		bank_product.update(bank_product_params)
		redirect_to root_path+"backstage/banks"
	end

	def bank_product_new
		@bank_product = BankProduct.new
	end

	def bank_product_create
		BankProduct.create(bank_product_params)
		redirect_to root_path+"backstage/banks"
	end

	def bank_product_delete
		bank_product = BankProduct.find(params[:bank_product_id])
		bank_product.delete
		redirect_to root_path+"backstage/banks"
	end

	def bank_products
		@bank = Bank.find(params[:bank_id])
	end

	def bank_product_detail
		
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
		params.require(:loan_case).permit(:is_dealed, :is_need_grace_period, :to_loan_period_years, :to_buy_price,:parking_price, :to_loan_price, :grace_period_years, :other_info, :address, :layer, :building_type, :rooms, :living_rooms, :rest_rooms, :building_area, :building_age, :house_decoration, :house_condition, :is_top_built,:top_building_area,:parking_type, :parking_layer, :parking_area, :applicant_name, :applicant_email, :applicant_phone, :applicant_age, :applicant_company_name, :applicant_title, :applicant_serve_year, :applicant_year_earning, :applicant_other_earning, :applicant_is_have_house,:applicant_other_house_loan, :applicant_other_credit_loan, :is_credit_ok, :advise)
	end

	def onlending_params
		params.require(:onlending).permit(:current_bank, :current_loan_price, :more_loan_price, :is_need_grace_period, :grace_period_years, :to_loan_period_years, :other_info, :address, :layer, :building_type, :rooms, :living_rooms, :rest_rooms, :building_area, :building_age, :house_decoration, :house_condition, :is_top_built,:top_building_area,:parking_type, :parking_layer, :parking_area, :applicant_name, :applicant_email, :applicant_phone, :applicant_age, :applicant_company_name, :applicant_title, :applicant_serve_year, :applicant_year_earning, :applicant_other_earning, :applicant_is_have_house,:applicant_other_house_loan, :applicant_other_credit_loan, :is_credit_ok, :advise)
	end

	def bank_product_params
		params.require(:bank_product).permit(:bank_id, :title, :interest, :binding, :grace_year, :portion, :other_info)
	end

end
