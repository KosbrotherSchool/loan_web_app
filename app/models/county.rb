class County < ActiveRecord::Base

	has_many :lender_county_ships
	has_many :lenders, :through => :lender_county_ships
	
end
