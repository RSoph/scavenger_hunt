class QuestionController < ApplicationController

	def show
		if params[:number]
			number = params[:number].to_i
			@question = Question.find_by(number: number)
			if params[:answer] == @question.answer
				number += 1
			else
				flash[:notice] = "Oops, try again!"
			end
		# number ||= 1
		@question = Question.find_by(number: number)
		end
	end

	private

    def question_params
      params.require(:question).permit(:number, :text, :answer)
    end
end
