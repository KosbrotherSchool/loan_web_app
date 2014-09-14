class CreditLoanController < ApplicationController

  def create
    @credit_case = CreditCase.new(credit_loan_params)

    if @credit_case.save
      redirect_to :controller => 'credit_loan', :action => 'apply_credit_loan', :msg => 'success'
    else
      render :apply_credit_loan
    end

  end

  def case_detail
  end

  def apply_credit_loan
  	if params[:msg] == 'success'
			
		else
			@credit_case = CreditCase.new
		end
  end

  private

  def credit_loan_params
    params.require(:credit_case).permit(:loan_money,:to_loan_period_years, :applicant_name, :applicant_email, :applicant_phone, :applicant_line_id, :applicant_age, :is_married, :education, :applicant_company_name, :applicant_title, :applicant_serve_year, :applicant_year_earning, :applicant_is_have_house, :applicant_is_have_house,:applicant_other_house_loan, :applicant_other_credit_loan, :is_pay_late_in_half_year, :credit_card_years, :is_lender_contact)
  end

end
