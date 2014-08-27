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
			# push_loan_case_to_gdoc(@loan_case.is_dealed, @loan_case.to_buy_price, @loan_case.parking_price, @loan_case.to_loan_price, @loan_case.is_need_grace_period, @loan_case.grace_period_years, @loan_case.to_loan_period_years, @loan_case.other_info, @loan_case.address, @loan_case.layer, @loan_case.building_type, @loan_case.rooms, @loan_case.living_rooms, @loan_case.rest_rooms, @loan_case.building_area, @loan_case.public_area, @loan_case.land_area, @loan_case.building_age, @loan_case.house_decoration, @loan_case.house_condition, @loan_case.is_top_built, @loan_case.top_building_area, @loan_case.parking_type, @loan_case.parking_layer, @loan_case.parking_area, @loan_case.applicant_name, @loan_case.applicant_email, @loan_case.applicant_phone1, @loan_case.applicant_phone2, @loan_case.applicant_age, @loan_case.applicant_company_name, @loan_case.is_applicant_company_founder, @loan_case.applicant_title, @loan_case.applicant_serve_year, @loan_case.applicant_year_earning, @loan_case.applicant_other_earning, @loan_case.applicant_company_type, @loan_case.applicant_is_have_house, @loan_case.applicant_other_house_loan, @loan_case.applicant_other_car_loan, @loan_case.applicant_other_learning_loan, @loan_case.is_applicant_use_revolving_interest, @loan_case.is_applicant_use_check, @loan_case.is_applicant_have_bounce_check)
			ConfirmMailer.delay.mail_content(@loan_case.id)
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
		params.require(:loan_case).permit(:is_dealed, :is_need_grace_period, :to_loan_period_years, :to_buy_price,:parking_price, :to_loan_price, :grace_period_years, :other_info, :address, :layer, :building_type, :rooms, :living_rooms, :rest_rooms, :building_area, :building_age, :house_decoration, :house_condition, :is_top_built,:top_building_area,:parking_type, :parking_layer, :parking_area, :applicant_name, :applicant_email, :applicant_phone, :applicant_age, :applicant_company_name, :applicant_title, :applicant_serve_year, :applicant_year_earning, :applicant_other_earning, :applicant_is_have_house,:applicant_other_house_loan, :applicant_other_credit_loan, :is_credit_ok, :is_lender_contact)
	end

end
