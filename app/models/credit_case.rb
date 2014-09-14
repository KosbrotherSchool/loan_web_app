class CreditCase < ActiveRecord::Base

	validates :loan_money, :presence => {:message => "請填寫欲貸款金額"}

	validates :applicant_age, :presence => {:message => "請填寫您的年齡"}
	validates :education, :presence => {:message => "請填寫您的學歷"}
	validates :applicant_company_name, :presence => {:message => "請填寫您的公司名稱"}
	validates :applicant_serve_year, :presence => {:message => "請填寫您的年資"}
	validates :applicant_year_earning, :presence => {:message => "請填寫您的年薪"}

	validates :applicant_name, :presence => {:message => "請填寫您的稱呼"}
	validates :applicant_email, :presence => {:message => "請填寫您的聯絡Email"}
	validates_format_of :applicant_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "信箱的格式錯誤"
	validates :applicant_phone, :presence => {:message => "請填寫您的聯絡電話"}
	
	

end
