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
  		if @goal.Route != "-1"
			@route = Route.find(@goal.Route)
		else
	  		route_string =  params[:newRoute]
			route_string = route_string.gsub(/[()]/, "")
			lat_lon_list = route_string.split(",")
			count = 0
			orderNum = 0
			@route = Route.create(:distance => params[:distance], :elevation_gain => params[:elevationGain], :elevation_loss => params[:elevationLoss])
			@route.save
			while count < lat_lon_list.size
				@route.points.create(:lat => lat_lon_list[count].to_f, :lon => lat_lon_list[count + 1].to_f, :orderNum => orderNum)
				count += 2
				orderNum += 1
			end
			@route.numPoints = orderNum
		end
		@route.runnable_id = @goal.id
		@route.save
		@goal.routes.push(@route)
		if !current_user.runs.nil?
			for ind_run in current_user.runs
				@predictval = predict(ind_run.date, @goal.id)
			end
		end
  		redirect_to @goal
	end
	def show
  		@goal = Goal.find(params[:id])
  		last_key = @goal.predictions.keys.sort.last
  		value = (@goal.predictions[last_key] * 3600).to_i
  		@predictval = [(value/3600), (value%3600)/60, (value%3600)%60, value]
  		@predHash = JSON.generate(@goal.predictions)
	end
	
	def destroy
  		@goal = Goal.find(params[:id])
  		@route = @goal.routes.first
  		if @route.name.nil?
  			@goal.routes.first.destroy
  		end
  		@goal.destroy
 
  		redirect_to goals_path
	end
	
	def edit
  		@goal = Goal.find(params[:id])
  		@points = Array.new
  		count = 0 
  		while count < @goal.routes.first.numPoints
  			point = Point.find_by route_id: @goal.routes.first.id, orderNum: count
  			@points.push('(' + point.lat.to_s + ', ' + point.lon.to_s + ')')
  			count += 1
  		end
  		@distance = @goal.routes.first.distance
  		@courses = Route.where("name != ?", "'nil'")
	end
	
	def update
  		@goal = Goal.find(params[:id])
  		@goal.predictions = Hash.new
 		route_string =  params[:newRoute]
		route_string = route_string.gsub(/[()]/, "")
		lat_lon_list = route_string.split(",")
		count = 0
		orderNum = 0
		@route = Route.create(:distance => params[:distance], :elevation_gain => params[:elevationGain], :elevation_loss => params[:elevationLoss])
		@route.save
		while count < lat_lon_list.size
			@route.points.create(:lat => lat_lon_list[count].to_f, :lon => lat_lon_list[count + 1].to_f, :orderNum => orderNum)
			count += 2
			orderNum += 1
		end
		@route.numPoints = orderNum
		@route.runnable_id = @goal.id
		@route.save
		if !@goal.routes.first.nil?
			oldRoute = @goal.routes.shift
			oldRoute.destroy
		end
		@goal.routes.push(@route)
		if !current_user.runs.nil?
			for ind_run in current_user.runs
				@predictval = predict(ind_run.date, @goal.id)
			end
		end
  		if @goal.update(params[:goal].permit(:GoalName, :gtHour, :gtMin, :gtSec, :Route))
    		redirect_to @goal
  		else
    		render 'edit'
  		end
	end
	
	private
	def goal_params
		params.require(:goal).permit(:GoalName, :gtHour, :gtMin, :gtSec, :Route)
	end

	

	def correct_user
      @goal = current_user.goals.find_by(id: params[:id])
      if @goal.nil?
      	flash[:badBoy] = "Bad bad bad.  That's not yours!"
      	redirect_to root_url
      end
    end

    
end
