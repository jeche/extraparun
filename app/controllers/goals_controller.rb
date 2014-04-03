class GoalsController < ApplicationController
	def new
	end

	def create
		@goal = current_user.goals.new(post_params)
  		@goal.save
  		redirect_to @goal
	end
	def show
  		@goal = Goal.find(params[:id])
	end
	def index
  		@goal = Goal.all
	end
	private
	def post_params
		params.require(:goals).permit(:GoalName, :GoalTime, :Route)
	end
end
