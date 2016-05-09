# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []
20.times do
users << User.create(
	fname:Faker::Name.first_name,
	lname:Faker::Name.last_name, 
	email:Faker::Internet.email,
	username:Faker::Internet.user_name,
	password:"12345")
end

posts = []
20.times do 
posts <<	Post.create(
	user_id: users.sample.id,
    body:Faker::Lorem.paragraph)
end 


20.times do 
	Comment.create(
	post_id:users.sample.id,
	user_id:users.sample.id,
	body:Faker::Lorem.sentences
		)
end 

