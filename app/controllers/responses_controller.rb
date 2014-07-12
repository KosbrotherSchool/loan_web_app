class ResponsesController < ApplicationController
  
  def show
  end

  def lender_response
  	@loan_case = LoanCase.find(params[:loan_case_id])
  	if params[:msg] == 'success'
			
		else
	  	@key = params[:key]
	  	@loan_response = LoanResponse.new
  	end 	
  end

  def create
  	# use key to find lender
  	@key = params[:key]
  	@lender = Lender.find(@key)
    @loan_case = LoanCase.find(params[:loan_case_id])
  	@loan_response = LoanResponse.new(response_param)
    @loan_response.lender_id = @lender.id
    @loan_response.loan_case_id = @loan_case.id
  	if @loan_response.save
      lenderLoanCaseShip = LenderLoanCaseShip.where("lender_id = #{@lender.id} and loan_case_id = #{@loan_case.id}").first
			lenderLoanCaseShip.is_responded = true
      lenderLoanCaseShip.save
      redirect_to :controller => "responses", :action => "lender_response", :msg => 'success'
		else
			render :lender_response
		end

  end

  private

  def response_param
  	params.require(:loan_response).permit(:loan_money, :loan_years, :interest_explaination, :is_binded, :grace_period, :expense_explaination, :other_info)
  end

end
