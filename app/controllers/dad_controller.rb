class DadController < ApplicationController

	def index
		if Time.now.to_s < "2016-03-01 12:00:00 -0500"
			render :not_yet
		else
			redirect_to questions_path({number: 1})
		end
	end
end
