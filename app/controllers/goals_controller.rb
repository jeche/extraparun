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
  		@predictval = predict
	end
	def index
  		@goals = Goal.all
	end
	
	

	private
	def post_params
		params.require(:goals).permit(:GoalName, :gtHour, :gtMin, :gtSec, :Route, :distance)
	end

	def predict
		sum = 0
		count = 0
		for ind_run in current_user.runs
			#raise ind_run.route.distance.inspect
			dist = ind_run.route.distance.to_i
			time = ind_run.hr.to_i * 60 * 60
			time += ind_run.min.to_i * 60
			time += ind_run.sec.to_i
			sum += (time/dist)
			count += 1
		end
		if count > 0
			avg = sum/count
			pred = avg * Goal.find(params[:id]).distance.to_i
			@ret = [(pred/3600), (pred%3600)/60, (pred%3600)%60, pred]
		else
			raise "hello"
			@ret = 0
		end
	end
end
