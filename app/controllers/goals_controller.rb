class GoalsController < ApplicationController
	before_action :signed_in_user
	before_action :correct_user, only: [:show, :edit, :destroy, :update]

	def new
		@goal = Goal.new
		@courses = Route.where("name != ?", "'nil'")
	end
	
	def index
		@goals = Goal.all
	end

	def create
		@goal = current_user.goals.new(goal_params)
		@goal.predictions = Hash.new
  		@goal.save
  		route_string =  params[:newRoute]
		route_string = route_string.gsub(/[()]/, "")
		lat_lon_list = route_string.split(",")
		count = 0
		orderNum = 0
		@route = Route.create(:distance => params[:distance])
		@route.save
		while count < lat_lon_list.size
			@route.points.create(:lat => lat_lon_list[count].to_f, :lon => lat_lon_list[count + 1].to_f, :orderNum => orderNum)
			count += 2
			orderNum += 1
		end
		@route.numPoints = orderNum
		@goal.routes.push(@route)
  		redirect_to @goal
	end
	def show
  		@goal = Goal.find(params[:id])
  		@predictval = predict
	end
	
	def destroy
  		@goal = Goal.find(params[:id])
  		@goal.destroy
 
  		redirect_to goals_path
	end
	
	def edit
  		@goal = Goal.find(params[:id])
	end
	
	def update
  		@goal = Goal.find(params[:id])
 
  		if @goal.update(params[:goal].permit(:GoalName, :gtHour, :gtMin, :gtSec, :Route, :distance))
    		redirect_to @goal
  		else
    		render 'edit'
  		end
	end
	
	private
	def goal_params
		params.require(:goal).permit(:GoalName, :gtHour, :gtMin, :gtSec, :Route, :distance)
	end

	def predict
		sum = 0
		count = 0
		for ind_run in current_user.runs
			dist = ind_run.routes.first.distance.to_i
			time = ind_run.hr.to_i * 60 * 60
			time += ind_run.min.to_i * 60
			time += ind_run.sec.to_i
			sum += (time/dist)
			count += 1
		end
		if count > 0
			goal = Goal.find(params[:id])
			avg = sum/count
			pred = avg * goal.distance.to_i
			goal.predictions[Time.now.strftime("%Y-%m-%dT%H:%M")] = pred/3600
			@predHash = JSON.generate(goal.predictions)
			goal.save
			@ret = [(pred/3600), (pred%3600)/60, (pred%3600)%60, pred]
		else
			@ret = 0
		end	
	end

	def correct_user
      @goal = current_user.goals.find_by(id: params[:id])
      if @goal.nil?
      	flash[:badBoy] = "Bad bad bad.  That's not yours!"
      	redirect_to root_url
      end
    end
end
