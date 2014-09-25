class SimpleCase < ActiveRecord::Base

	validates :name, :presence => {:message => "請填寫您的稱呼"}
	validates :age, :presence => {:message => "請填寫您的年齡"}
	validates :loan_money, :presence => {:message => "請填寫欲貸款金額"}
	validates :line_id, :presence => {:message => "請填寫 LINE ID 或 電話"}

end
