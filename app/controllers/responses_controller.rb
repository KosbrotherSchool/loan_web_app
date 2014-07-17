class ResponsesController < ApplicationController
  
  def show
  end

  def lender_response
    @token = params[:token]
    loan_case_id = params[:loan_case_id]
    @key = params[:key]
    lender_id = AES.decrypt(@key, ENV["KEY"])
    lenderLoanCaseShip = LenderLoanCaseShip.where("lender_id = #{lender_id} and loan_case_id = #{loan_case_id}").first
    lenderLoanCaseShip.view_nums = lenderLoanCaseShip.view_nums + 1
    lenderLoanCaseShip.save

    if loan_case_id == AES.decrypt(@token, ENV["KEY"])
      begin
        @loan_case = LoanCase.find(loan_case_id)
        if params[:msg] == 'success'
          #show success msg in view 
        else    
          if LoanResponse.where("loan_case_id = #{loan_case_id} and lender_id = #{lender_id}").first != nil
            @loan_response = LoanResponse.where("loan_case_id = #{loan_case_id} and lender_id = #{lender_id}").first
          else
            @loan_response = LoanResponse.new
          end  
        end 
      rescue Exception => e
        redirect_to root_path
      end
    else

    redirect_to root_path

    end
  	
  end

  def create
  	# use key to find lender
  	key = params[:key]
    lender_id = AES.decrypt(key, ENV["KEY"])
  	@lender = Lender.find(lender_id)
    @loan_case = LoanCase.find(params[:loan_case_id])
  	@loan_response = LoanResponse.new(response_param)
    @loan_response.lender_id = @lender.id
    @loan_response.loan_case_id = @loan_case.id
  	if @loan_response.save
      lenderLoanCaseShip = LenderLoanCaseShip.where("lender_id = #{@lender.id} and loan_case_id = #{@loan_case.id}").first
			lenderLoanCaseShip.is_responded = true
      lenderLoanCaseShip.save
      redirect_to :controller => "responses", :action => "lender_response", :msg => 'success', :token => params[:token]
		else
      @token = params[:token]
      @key = params[:key]
			render :lender_response
		end

  end

  def lender_response_update
    loan_case_id = AES.decrypt(params[:token], ENV["KEY"])
    lender_id = AES.decrypt(params[:key], ENV["KEY"])
    @loan_response = LoanResponse.where("loan_case_id = #{loan_case_id} and lender_id = #{lender_id}").first
    @loan_case = LoanCase.find(loan_case_id)
    begin
      @loan_response.update! (response_param)
      redirect_to :controller => "responses", :action => "lender_response", :msg => 'success', :token => params[:token]
    rescue Exception => e
      @token = params[:token]
      @key = params[:key]
      render :lender_response
    end

  end

  private

  def response_param
  	params.require(:loan_response).permit(:loan_money, :loan_years, :interest_explaination, :is_binded, :grace_period, :expense_explaination, :other_info)
  end

end
