class QuestionController < ApplicationController

	def show
		if params[:number]
			number = params[:number].to_i
			@question = Question.find_by(number: number)
			if params[:answer] && (params[:answer].downcase.strip == @question.answer)
				number += 1
				if number == 8
					render :last and return
				end
			else
				flash[:notice] = "Oops, try again!"
			end
		end
		number ||= 1
		@question = Question.find_by(number: number)
	end

	private

    def question_params
      params.require(:question).permit(:number, :text, :answer)
    end
end
