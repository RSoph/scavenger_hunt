class TextController < ApplicationController
	def index

		@question = [ "text of question 1",
					  "text of question 2",
					  "text of question 3",
					  "text of question 4"
					]
		@answer = 	[ "answer to question 1",
					  "answer to question 2",
					  "answer to question 3",
					  "answer to question 4"
					]
		@hint = 	[ "hint for question 1",
					  "hint for question 2",
					  "hint for question 3",
					  "hint for question 4"
					]
		@error = ["I didn't get that, error!"]

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

		if body == 'hunt' # beginning
			question_number = 1
	  		message(from_number, @question[0])
	  		message('7187535492', 'first text')
	  	elsif body == 'hint'
			message(from_number, @hint[question_number])
		elsif body == @answer[question_number]
			question_number += 1
			message(from_number, @question[question_number])
			message('7187535492', "texted question number #{question_number}")
		else
			message(from_number, @error[0])
		end
		render nothing: true
	end

	private

	def text_params
      params.permit(:message_body, :from_number)
    end
end