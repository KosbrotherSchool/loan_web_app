class LenderCountyShip < ActiveRecord::Base

	belongs_to :lender
	belongs_to :county

end
