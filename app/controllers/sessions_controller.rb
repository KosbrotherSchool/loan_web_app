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
	    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
	    if request.referer == sign_in_url
	      backstage_path
	    else
	    	stored_location_for(resource) || request.referer || root_path
	    end
  	end

end