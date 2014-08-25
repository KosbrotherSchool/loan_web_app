namespace :user_lender do

	task :add_lender_to_user_lenders => :environment do
		Lender.all.each do |lender|
			UserLender.create!({:email => lender.email, :password => lender.contact_personal_phone, :password_confirmation => lender.contact_personal_phone })
		end
	end

end