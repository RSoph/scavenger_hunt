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
		7 => ["That's quite a lot of living! Tell me, in all that time have you ever lived outside of NYC?", 'no'],
		8 => ["Just to make sure you're paying attention: if you roll a fair, 6-sided die three times, what are the odds of NOT getting a six? Give your answer as a fraction like this 2/3", "125/216"],
		9 => ["True or false, there exists a highest prime number?", "false"],
		10 => ["Ok then, how many digits does the highest known prime have?", "17425170"],
		11 => ["Which of the United States has the lowest population density?", "wyoming"],
		12 => ["...and in what year did you last visit that state?", "1995"],
		13 => ["What is the sum of all of the prime numbers less than 1000? You may have to write some code to figure this out, no looking up the answer!", "76127"]
		}

hash.each do |k, v|
	question = Question.new
	question.number = k
	question.text = v[0]
	question.answer = v[1]
	question.save!
end