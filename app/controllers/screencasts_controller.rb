class ScreencastsController < ApplicationController

	# Get screencasts
	# Get screencasts.json
	def index
		render json: Screencast.all
	end

	#get screencasts id
	#get screencasts id json
	def show
		render json: Screencast.find(params[:id])
	end
end
