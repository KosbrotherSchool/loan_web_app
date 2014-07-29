class OnlendingsController < ApplicationController

	def apply_onlending
  	@onlending = Onlending.new
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
			# ConfirmMailer.delay.mail_content(@onlending.id)
			redirect_to :controller => 'onlendings', :action => 'apply_onlending', :msg => 'success'
		else
			render :apply_onlending
		end
	end

	private

  def onlending_params
		params.require(:onlending).permit(:current_bank, :current_loan_price, :more_loan_price, :is_need_grace_period, :grace_period_years, :to_loan_period_years, :other_info, :address, :layer, :building_type, :rooms, :living_rooms, :rest_rooms, :building_area, :building_age, :house_decoration, :house_condition, :is_top_built,:top_building_area,:parking_type, :parking_layer, :parking_area, :applicant_name, :applicant_email, :applicant_phone, :applicant_age, :applicant_company_name, :applicant_title, :applicant_serve_year, :applicant_year_earning, :applicant_other_earning, :applicant_is_have_house,:applicant_other_house_loan, :applicant_other_credit_loan, :is_credit_ok)
	end

end
