class BanksController < ApplicationController
  
  def banks_list
  	@banks = Bank.all
  end

  def bank_products
  	@bank = Bank.friendly.find(params[:bank_id])
  	# @bank = Bank.find(params[:bank_id])
  end

end
