namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		99.times do |n|
			name = Faker::Name.name
			email = "zubin_replicate#{n}@gmail.com"
			password = "foobar"
			
			admin = User.create!(name: name,
				     password: password,
				     email: email,
				     password_confirmation: password)
			admin.toggle!(:admin)
		end
	end
end	
