class Bank < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name

	has_many :bank_products
end
