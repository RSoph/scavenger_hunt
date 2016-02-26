class TextController < ApplicationController
	def index

		@question = [ "In 1990, a bank branch opened in Park Slope, which you said was so ugly it belonged in Manhattan, not Brooklyn. What is the address number of that bank branch?",
					  "Go to the shortest street in the whole neighborhood. How many fire hydrants does it have?",
					  "321 are consectutive integers, but a true Park Slopian knows that those numbers are usually prefixed by what two letters?",
					  "Right. Now, how many steps down do you take to get to that school's front entrance?",
					  "One last math problem: What is the smallest integer that can be expressed as the sum of a prime and a composite, and is itself a prime?",
					  "What is the last name of the 20th US President? (feel free to look it up or call a friend)",
					  "Looks like we're going to 7th and Garfield! When you get there, tell me the total number of stripes painted in the crosswalks at that intersection",
					  "Congratulations you win! You've won a free lunch at Upstairs Mexican! But this offer is only good if you go in right now. Thanks for playing!"
					]
		@answer = 	[ "110",
					  "1",
					  "ps",
					  "5",
					  "7",
					  "garfield",
					  "20",
					  ""
					]
		@hint = 	[ "It's on President street and 7th Ave",
					  "The street is Polhemus!",
					  "321 is the partial name of a school in the neighborhood",
					  "I can't think of a good hint for this one. It's between 4 and 6.",
					  "It's less than 10",
					  "Also the name of a famous cartoon cat.",
					  "It should be the same as your total number of fingers and toes.",
					  ""
					]
		@error = ["I didn't get that, could you try again? I do best if you leave off any punctuation and use numerals when you can."]

		message_body = params["Body"]
		message_body ||= "just testing"
		body = message_body.downcase.strip
		from_number = params["From"]
		from_number ||= '7187535492'
		question_number = 0

		def message(to_number, text_body)
			client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
			message = client.messages.create(
			from: "+15675234372",
			to: to_number,
			body: text_body
			)
		end

		@tracker = (Tracker.first || Tracker.create({"number" => 0}))

		if body == 'hunt'
			message(from_number, "Welcome! Remember, you can always text 'hint' for a hint on your current question.")
	  		message(from_number, @question[@tracker.number])
	  	elsif body == 'hint'
			message(from_number, @hint[@tracker.number])
		elsif body == @answer[@tracker.number]
			@tracker.number += 1
			@tracker.save!
			message(from_number, @question[@tracker.number])
		else
			message(from_number, @error[0])
		end
		if @tracker.number == 7
			@tracker.destroy
		end
		render nothing: true
	end

	private

	def text_params
      params.permit(:message_body, :from_number)
    end
end