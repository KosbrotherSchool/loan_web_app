class Access < ActiveRecord::Base
	validates :address, :presence => {:message => "請填寫房屋地址"}
	validates :building_age, :presence => {:message => "請填寫屋齡"}
	validates :rooms, :presence => {:message => "請選擇房數"}
	validates :living_rooms, :presence => {:message => "請選擇廳數"}
	validates :rest_rooms, :presence => {:message => "請選擇衛數"}
	validates :building_area, :presence => {:message => "請填寫建物坪數"}
	
	validates :applicant_name, :presence => {:message => "請填寫您的稱呼"}
	validates :applicant_line_id_or_phone, :presence => {:message => "請填寫您的聯絡 LINE 或電話"}
end
