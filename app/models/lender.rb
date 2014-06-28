class Lender < ActiveRecord::Base

	validates :name, presence: true
	validates :email, presence: true
	validates :contact_company_phone, presence: true

end
