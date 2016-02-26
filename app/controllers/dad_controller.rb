class DadController < ApplicationController

	def index
		# if Time.now.to_s > "2016-02-29 13:33:25 -0500"
		if Time.now.to_s < "2016-02-29 13:33:25 -0500"
			render :not_yet
		else
			# @question = Question.find_by(number: "1")
			redirect_to questions_path({number: 1})
		end
	end

	def start
	end
end
