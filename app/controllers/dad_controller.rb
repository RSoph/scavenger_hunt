class DadController < ApplicationController

	def index
		if Time.now.to_s < "2016-02-25 13:33:25 -0500"
			render :not_yet
		else
			render :start
		end
	end
end
