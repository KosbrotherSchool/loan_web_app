class RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

  def after_sign_up_path_for(resource)
  	Lender.new("email" => current_user_lender.email, "user_lender_id" => current_user_lender.id, "line_id" => params[:line_id]).save(:validate => false)
  	"/user_lenders/#{current_user_lender.lender.id}/user_center"
  end

end