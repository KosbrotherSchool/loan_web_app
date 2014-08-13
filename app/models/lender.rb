class Lender < ActiveRecord::Base
	belongs_to :user_lender

	has_many :lender_county_ships
	has_many :counties, :through => :lender_county_ships

	has_many :loan_responses
	has_many :lender_loan_case_ships
	has_many :loan_cases, :through => :lender_loan_case_ships

	has_attached_file :avatar, :styles => { :medium => "350>x264", :thumb => "175>x132" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_attached_file :card, :styles => { :medium => "3000>x30", :thumb => "200>x100" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :card, :content_type => /\Aimage\/.*\Z/

	validates :name, :presence => {:message => "請填入姓名"}
	validates :email, :presence => { :message => "請填入郵件信箱" } 
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "信箱的格式錯誤"
	validates :contact_company_phone, :presence => {:message => "請填入公司電話"}
	validates :fax_phone, :presence => {:message => "請填入傳真電話"}
	validates :contact_personal_phone, :presence => {:message => "請填入聯絡電話"}
	validates :bank , :presence => {:message => "請填入銀行名稱"}
	validates :bank_branch , :presence => {:message => "請填入分行/通訊處名稱"}
	validates :work_title , :presence => {:message => "請填入職稱"}

end
