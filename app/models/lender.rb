class Lender < ActiveRecord::Base

	has_many :lender_county_ships
	has_many :counties, :through => :lender_county_ships

	has_many :loan_responses
	has_many :lender_loan_case_ships
	has_many :loan_cases, :through => :lender_loan_case_ships

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_attached_file :card, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :card, :content_type => /\Aimage\/.*\Z/

	validates :name, presence: true
	validates :email, presence: true
	validates :contact_company_phone, presence: true

end
