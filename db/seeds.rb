# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

channel = Channel.new(
		:title					=> 'General',
		:id 					=> 1
	)
channel.save!


	admin = User.new(
	      :email                 => "admin@apextion.com",
	      :password              => "administration",
	      :password_confirmation => "administration",
	      :first_name            => "Captain",
	      :last_name             => "Ludus"
		)
	admin.save!

users = Array.new
10.times do
	pwd = Faker::Internet.password(10,20)
	user = User.new(
	      :email                 => Faker::Internet.email,
	      :password              => pwd,
	      :password_confirmation => pwd,
	      :first_name 			 => Faker::Name.first_name,
	      :last_name			 => Faker::Name.last_name
		)
	user.save!
	users.push(user)
end

25.times do 
	msg = Msg.new(
			:content			=> Faker::Lorem.sentence,
			:user_id			=> users.sample.id,
			:channel_id			=> 1
		)
	msg.save!
end