class BackstageController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		@loan_cases = LoanCase.all
	end

	def deliver_mail
		loan_case = LoanCase.find(params[:key])
		loan_case.deliver_time = Time.now
		loan_case.status_id = 2
		loan_case.save

		# deliver reply mail
		ReplyApplierMailer.mail_content(loan_case.id).deliver

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

	private 

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

end
