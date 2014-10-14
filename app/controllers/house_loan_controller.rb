class HouseLoanController < ApplicationController

	def index
		@lenders = Lender.where("is_show = true")
	end

	def new
	end

	def join_us
		if params[:msg] == 'success'
			
		else
			@lender = Lender.new
		end
	end

	def pricing
	end

	def about_us	
	end

	def faq	
	end

	def term	
	end

	def privacy	
	end

	def lender_response
	end

	def apply_case
		if params[:msg] == 'success'
			
		else
			@access = Access.new
			if params[:address] != nil
				@access.address = params[:address]
			end
		end
	end

	def case_create
		@access = Access.new(access_params)

    if @access.save
    	AccessInformManagerMailer.delay.mail_content(@access.id)
      redirect_to :controller => 'house_loan', :action => 'apply_case', :msg => 'success'
    else
      render :apply_case
    end
	end


	private 

	def to_boolean(str)
      str == 'true'
  end

	def access_params
		params.require(:access).permit(:address, :building_age, :building_type, :rooms, :living_rooms, :rest_rooms, :building_area, :applicant_name, :applicant_line_id_or_phone, :other_info)
	end

end
