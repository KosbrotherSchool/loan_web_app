require 'csv'

namespace :parse_qa do

	task :parse_all => ["parse_qa:parse_house_qa", "parse_qa:parse_credit_qa", "parse_qa:parse_car_qa", "parse_qa:parse_integrate_qa"]

	task :parse_house_qa => :environment do
		csv_text = File.read('public/qa_house.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
			hash = row.to_hash
			qa = Qa.new
			qa.type_id = 1
			qa.title = hash["Q"]
			qa.content = hash["A"]
			qa.save
		end
	end

	task :parse_credit_qa => :environment do
		csv_text = File.read('public/qa_credit.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
			hash = row.to_hash
			qa = Qa.new
			qa.type_id = 2
			qa.title = hash["Q"]
			qa.content = hash["A"]
			qa.save
		end
	end

	task :parse_car_qa => :environment do
		csv_text = File.read('public/qa_car.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
			hash = row.to_hash
			qa = Qa.new
			qa.type_id = 3
			qa.title = hash["Q"]
			qa.content = hash["A"]
			qa.save
		end
	end

	task :parse_integrate_qa => :environment do
		csv_text = File.read('public/qa_integrate.csv')
		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
			hash = row.to_hash
			qa = Qa.new
			qa.type_id = 4
			qa.title = hash["Q"]
			qa.content = hash["A"]
			qa.save
		end
	end

end