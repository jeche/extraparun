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
  		redirect_to @goal
	end
	def show
  		@goal = Goal.find(params[:id])
  		@predictval = predict
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
			sum += mainNormalization(time, ind_run.routes.first.distance, ind_run.temp, ind_run.routes.first)
			#sum += (time/dist)
			count += 1
		end
		if count > 0
			goal = Goal.find(params[:id])
			avg = sum/count
			pred = mainExtrapolation(0, goal.routes.first, avg).to_i
			#pred = avg * goal.routes.first.distance.to_i
			goal.predictions[Time.now.strftime("%Y-%m-%dT%H:%M")] = pred/3600.0
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

    	#Base method for normalization
	def mainNormalization(timeSecs, distanceMi, temp, route)
		stateTime = timeSecs; #running state of time as it goes through normalization  
		#elevationTup = gatherElevationFromRoute(route)
		#stateTime = normalizeForTemperature(stateTime, temp)
		#Add more modules here(Those that deal with whole times)

		perMile = stateTime/distanceMi.to_f
		perMile = normalizeForElevationChange(route.elevation_gain, route.elevation_loss, perMile)
		#Add more modules here(Those that deal with per mile times)
		return perMile
	end

	def mainExtrapolation(expTemp, route, avgPerMile)
		#perMile = getUserAverageMiTime()
		#elevationTup = gatherElevationFromRoute(route)
		if !route.elevation_gain.nil?
			perMile = extrapolateForElevationChange(route.elevation_gain, route.elevation_loss, avgPerMile)
		else
			perMile = avgPerMile  # IS THIS WHAT I WANT IT TO BE?
		end
		#Add more modules here(Those that deal with per mile times)
		extrapTime = perMile * route.distance.to_f
		#extrapTime = extrapolateForTemperatureChange(expTemp)  Add back in if we have temperature and date for a goal
		#Add more modules here(Those that deal with whole times)

		return extrapTime
	end

	def normalizeForElevationChange(inclElev, desElev, timeSecs)
		inclFactor = ((inclElev / 100.0)*6.6)/100.0 
		descFactor = ((desElev / 100.0)*3.63)/100.0
		addTime = inclFactor * timeSecs #add lost time back
		decTime = descFactor * timeSecs # subtract gained time
		normalizedTime = timeSecs+addTime-decTime
		return normalizedTime
	end

	def extrapolateForElevationChange(inclElev, desElev, timeSecs)
		inclFactor = ((inclElev / 100.0)*6.6)/100.0 
		descFactor = ((desElev / 100.0)*3.63)/100.0
		addTime = descFactor * timeSecs #add potential gained time
		decTime = inclFactor * timeSecs # subtract time lost due to hills
		extrapolatedTime = timeSecs+addTime-decTime
		return extrapolatedTime
	end
end
