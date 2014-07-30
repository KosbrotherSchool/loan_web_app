class OnlendingsController < ApplicationController

	def apply_onlending
		if params[:msg] == 'success'
			
		else
  		@onlending = Onlending.new
  	end
  end

  def create
  	@onlending = Onlending.new(onlending_params)

  	begin
  		if params[:county] != nil && params[:county] != ""
  			@onlending.address = params[:county] + params[:district] + @onlending.address
  		end
  		
  		County.all.each do |county|
				county_s = @onlending.address[0..1]
				if county.name.include? county_s
					@onlending.county_id = county.id
				end
			end
  	rescue Exception => e
  		
  	end

		@onlending.status_id = 1

		if @onlending.save
			OnlendingConfirmMailer.delay.mail_content(@onlending.id)
			redirect_to :controller => 'onlendings', :action => 'apply_onlending', :msg => 'success'
		else
			render :apply_onlending
		end
	end

	def lender_response
		@token = params[:token]
    onlending_id = params[:onlending_id]

    begin
      @key = params[:key]
      lender_id = AES.decrypt(@key, ENV["KEY"])
      lenderOnlendingShip = LenderOnlendingShip.where("lender_id = #{lender_id} and onlending_id = #{onlending_id}").first
      lenderOnlendingShip.view_nums = lenderLoanCaseShip.view_nums + 1
      lenderOnlendingShip.save
    rescue Exception => e
      
    end

    if onlending_id == AES.decrypt(@token, ENV["KEY"])
      
      begin
        @onlending = Onlending.find(onlending_id)
        if params[:msg] == 'success'
          #show success msg in view 
        else    
          if OnlendingResponse.where("onlending_id = #{onlending_id} and lender_id = #{lender_id}").first != nil
            @onlending_response = OnlendingResponse.where("onlending_id = #{onlending_id} and lender_id = #{lender_id}").first
          else
            @onlending_response = OnlendingResponse.new
          end  
        end 
      rescue Exception => e
        redirect_to root_path
      end

    else

      redirect_to root_path

    end
	end

	private

  def onlending_params
		params.require(:onlending).permit(:current_bank, :current_loan_price, :more_loan_price, :is_need_grace_period, :grace_period_years, :to_loan_period_years, :other_info, :address, :layer, :building_type, :rooms, :living_rooms, :rest_rooms, :building_area, :building_age, :house_decoration, :house_condition, :is_top_built,:top_building_area,:parking_type, :parking_layer, :parking_area, :applicant_name, :applicant_email, :applicant_phone, :applicant_age, :applicant_company_name, :applicant_title, :applicant_serve_year, :applicant_year_earning, :applicant_other_earning, :applicant_is_have_house,:applicant_other_house_loan, :applicant_other_credit_loan, :is_credit_ok)
	end

end
