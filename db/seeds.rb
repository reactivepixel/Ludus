# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
	pwd = Faker::Internet.password(10,20)
	user = User.new(
	      :email                 => Faker::Internet.email,
	      :password              => pwd,
	      :password_confirmation => pwd
		)
	user.save!
	5.times do 
		msg = Msg.new(
				:content			=> Faker::Lorem.sentence,
				:user_id			=> user.id
			)
		msg.save!
	end
end