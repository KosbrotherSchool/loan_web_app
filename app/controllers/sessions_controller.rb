class SessionsController < Devise::SessionsController

		def new
			super
		end

		def create
			super
		end

		def sign_out
			super
		end

  	def after_sign_in_path_for(resource)
  		if current_user_lender != nil && current_user != nil
  			backstage_path
  		elsif current_user_lender != nil
  			lender_id = current_user_lender.lender.id
				"/user_lenders/#{lender_id}/user_center"
			elsif current_user != nil
				backstage_path
			else
	    	stored_location_for(resource) || request.referer || root_path			
  		end
  	end

end