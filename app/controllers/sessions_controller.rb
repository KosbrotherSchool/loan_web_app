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
  		# binding.pry
  		if current_user_lender != nil && current_user != nil
  			backstage_path
  		elsif current_user_lender != nil
				"/user_lenders/#{current_user_lender.id}/user_center"
			elsif current_user != nil
				backstage_path
			else
	    	stored_location_for(resource) || request.referer || root_path			
  		end
  	end

end