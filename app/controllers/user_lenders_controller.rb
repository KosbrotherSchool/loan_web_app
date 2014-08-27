class UserLendersController < ApplicationController
	before_filter :authenticate_user_lender!

  def user_center
  	@lender = Lender.find(params[:lender_id])
  end

  def user_cases
  	@lender = Lender.find(params[:lender_id])
  end

  def user_onlendings
  	@lender = Lender.find(params[:lender_id])
  end

  def user_edit
  	@lender = Lender.find(params[:lender_id])
  end

  def user_update
  	lender = Lender.find(params[:lender_id])
  	if lender.update(lender_params)
	  	County.all.each do |county|
				if params["county_#{county.id}"]
					if LenderCountyShip.where("lender_id = #{lender.id} and county_id = #{county.id}").size() == 0
						lenderCountyShip = LenderCountyShip.new
						lenderCountyShip.lender_id = lender.id
						lenderCountyShip.county_id = county.id
						lenderCountyShip.save
					end
				else
					if LenderCountyShip.where("lender_id = #{lender.id} and county_id = #{county.id}").size() != 0
						lenderCountyShip = LenderCountyShip.where("lender_id = #{lender.id} and county_id = #{county.id}").first
						lenderCountyShip.delete
					end
				end
			end
			redirect_to root_path+"user_lenders/#{lender.id}/user_center"
		else
			@lender = lender
			render :user_edit
		end
  end

  def lender_params
		params.require(:lender).permit(:name,:email,:contact_company_phone, :fax_phone, :contact_personal_phone, :bank, :bank_branch, :work_title, :avatar, :card, :is_male)
	end

end

