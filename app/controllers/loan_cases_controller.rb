class LoanCasesController < ApplicationController
  
	def apply_mortgage
		if params[:msg] == 'success'
			
		else
			@loan_case = LoanCase.new
		end
	end


  def create
  	@loan_case = LoanCase.new(loan_case_params)
  	@loan_case.advise = ""
  	@loan_case.dead_time = Time.now + 5.days

  	begin
  		if params[:county] != nil && params[:county] != ""
  			@loan_case.address = params[:county] + params[:district] + @loan_case.address
  		end
  		
  		County.all.each do |county|
				county_s = @loan_case.address[0..1]
				if county.name.include? county_s
					@loan_case.county_id = county.id
				end
			end
  	rescue Exception => e
  		
  	end

		@loan_case.status_id = 1

		if @loan_case.save
			LoancaseConfirmMailer.delay.mail_content(@loan_case.id)
			LoancaseInfomManagerMailer.delay.mail_content(@loan_case.id)
			redirect_to :controller => 'loan_cases', :action => 'apply_mortgage', :msg => 'success'
		else
			render :apply_mortgage
		end
  end


  def case_detail
  	@token = params[:token]
    @key = params[:key]
    lender_id = AES.decrypt(@key, ENV["KEY"])
    loan_case_id = params[:loan_case_id]

    if loan_case_id == AES.decrypt(@token, ENV["KEY"])   
      @loan_case = LoanCase.find(loan_case_id)
      @loan_response = LoanResponse.where("loan_case_id = #{loan_case_id} and lender_id = #{lender_id}").first
    else
      redirect_to root_path
    end
  end

  private

  def loan_case_params
		params.require(:loan_case).permit(:is_dealed, :is_need_grace_period, :to_loan_period_years, :to_buy_price,:parking_price, :to_loan_price, :grace_period_years, :other_info, :address, :layer, :building_type, :rooms, :living_rooms, :rest_rooms, :building_area, :building_age, :house_decoration, :house_condition, :is_top_built,:top_building_area,:parking_type, :parking_layer, :parking_area, :applicant_name, :applicant_email, :applicant_phone, :applicant_age, :applicant_company_name, :applicant_title, :applicant_serve_year, :applicant_year_earning, :applicant_other_earning, :applicant_is_have_house,:applicant_other_house_loan, :applicant_other_credit_loan, :is_credit_ok, :is_lender_contact, :line_id)
	end

end
