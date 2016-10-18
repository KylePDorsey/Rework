5.times{User.create!(
	username: Faker::Internet.user_name, 
	email: Faker::Internet.email, 
	password: 'password')}

auction_start_time = [
	DateTime.new(2016,10,16,18,01,01, '-5'),
	DateTime.new(2016,10,12,18,01,01, '-5'),
	DateTime.new(2016,10,15,18,01,01, '-5'),
	DateTime.new(2016,10,19,18,01,01, '-5'),
	DateTime.new(2016,10,15,18,01,01, '-5'),
	DateTime.new(2016,10,14,18,01,01, '-5'),
	DateTime.new(2016,10,15,18,01,01, '-5'),
	DateTime.new(2016,10,1,18,01,01, '-5'),
	DateTime.new(2016,10,15,18,01,01, '-5'),
	DateTime.new(2016,10,15,18,01,01, '-5')
]

auction_end_time = [
	DateTime.new(2016,10,23,18,01,01, '-5'),
	DateTime.new(2016,10,25,18,01,01, '-5'),
	DateTime.new(2016,10,25,18,01,01, '-5'),
	DateTime.new(2016,10,5,18,01,01, '-5'),
	DateTime.new(2016,10,25,18,01,01, '-5'),
	DateTime.new(2016,10,26,18,01,01, '-5'),
	DateTime.new(2016,10,25,18,01,01, '-5'),
	DateTime.new(2016,10,28,18,01,01, '-5'),
	DateTime.new(2016,10,25,18,01,01, '-5'),
	DateTime.new(2016,10,25,18,01,01, '-5')

]

10.times{Auction.create!(
	user_id: rand(1..5), 
	name: Faker::Internet.user_name, 
	description: Faker::Hacker.say_something_smart, 
	condition: 'Good', 
	start_time: auction_start_time.sample, 
	end_time: auction_end_time.sample)}

20.times{Bid.create!(
	user_id: rand(1..5), 
	auction_id: rand(1..10), 
	ammount: Faker::Number.decimal(2))}





