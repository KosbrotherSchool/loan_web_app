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
  		
  		if current_user_lender != nil
				"/user_lenders/1/user_center"
			elsif current_user != nil
				backstage_path
			else
	    	stored_location_for(resource) || request.referer || root_path			
  		end

	    # sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
	    # if request.referer == sign_in_url
	    # if current_user != nil
	    #   backstage_path
	    # else
	    # 	stored_location_for(resource) || request.referer || root_path
	    # end
  	end

end