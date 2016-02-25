# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

hash = {
		1 => ['What is your middle name?', 'elliot'],
		2 => ['What year were you born?', '1946'],
		3 => ["Wow, that means you're 70 this year! How many prime factors does 70 have?", '3'],
		4 => ["Yep, you're definitely Mel. Just to double check, in what year did you get married?", '1981'],
		5 => ['...and in what year did you first become a Dad?', '1984'],
		6 => ['...and the second time you became a Dad?', '1986'],
		7 => ["That's quite a lot of living! Tell me, in all that time have you ever lived outside of NYC?", 'no']
		}

hash.each do |k, v|
	question = Question.new
	question.number = k
	question.text = v[0]
	question.answer = v[1]
	question.save!
end