# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

hash = {
		1 => ['text of question 1', 'answer 1'],
		2 => ['text of question 2', 'answer 2'],
		3 => ['text of question 3', 'answer 3'],
		4 => ['text of question 4', 'answer 4'],
		5 => ['text of question 5', 'answer 5'],
		6 => ['text of question 6', 'answer 6'],
		7 => ['text of question 7', 'answer 7']
		}

hash.each do |k, v|
	question = Question.new
	question.number = k
	question.text = v[0]
	question.answer = v[1]
	question.save!
end