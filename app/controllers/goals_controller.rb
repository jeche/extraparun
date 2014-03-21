class GoalsController < ApplicationController
	def new
	end

	def create
		@goal = Goals.new(post_params)
  		@goal.save
  		redirect_to @goal
	end
	def show
  		@goal = Goals.find(params[:id])
	end
	def index
  		@goal = Goals.all
	end
	private
	def post_params
		params.require(:goals).permit(:GoalName, :GoalTime, :Route)
	end
end
