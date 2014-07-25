class LoanCase < ActiveRecord::Base

	has_many :loan_responses
	has_many :lender_loan_case_ships
	has_many :lenders, :through => :lender_loan_case_ships
	belongs_to :lender
	belongs_to :county

	validates :to_buy_price, :presence => {:message => "請填寫成交總價"}
	validates :to_loan_price, :presence => {:message => "請填寫預計貸款金額"}

	validates :address, :presence => {:message => "請填寫房屋地址"}
	validates :layer, :presence => {:message => "請填寫房屋樓層"}
	validates :rooms, :presence => {:message => "請選擇房數"}
	validates :living_rooms, :presence => {:message => "請選擇廳數"}
	validates :rest_rooms, :presence => {:message => "請選擇衛數"}
	validates :building_age, :presence => {:message => "請填寫屋齡"}

	validates :applicant_name, :presence => {:message => "請填寫您的稱呼"}
	validates :applicant_email, :presence => {:message => "請填寫您的聯絡Email"}
	validates_format_of :applicant_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "信箱的格式錯誤"
	validates :applicant_phone, :presence => {:message => "請填寫您的聯絡電話"}
	validates :applicant_age, :presence => {:message => "請填寫您的年齡"}
	validates :applicant_company_name, :presence => {:message => "請填寫您的公司名稱"}
	validates :applicant_serve_year, :presence => {:message => "請填寫您的年資"}
	validates :applicant_year_earning, :presence => {:message => "請填寫您的年薪"}

	validates :county_id, :presence => {:message => "縣市位址有錯誤"}

end
