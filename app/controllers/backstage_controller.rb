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

	def lenders
		@lenders = Lender.all
	end

	def update_lender
		lender = Lender.find(params[:lender][:id])
		lender.is_show = checkTrueFalseByName(params[:lender][:is_show])
		lender.is_person_confirmed = checkTrueFalseByName(params[:lender][:is_person_confirmed])
		lender.save
		lender.update(lender_avatar_params)
		redirect_to backstage_lenders_path
	end

	def loan_case_detail
		@loan_case = LoanCase.find(params[:loan_case_id])
		@lenders = Lender.joins(:lender_loan_case_ships).where("loan_case_id = #{@loan_case.id}")
	end

	def county_lenders
		@county = County.find(params[:county_id])
		@lenders = @county.lenders
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

end
