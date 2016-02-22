class QuestionController < ApplicationController

	def show
		number = params[:number] if params[:number]
		number ||= 1
		@question = Question.find_by(number: number)
	end
end
