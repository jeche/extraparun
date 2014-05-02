class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  def predict (date, id)
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
			goal = Goal.find(id)
			avg = sum/count
			pred = mainExtrapolation(0, goal.routes.first, avg).to_i
			#pred = avg * goal.routes.first.distance.to_i
			goal.predictions[date] = pred/3600.0
			goal.save
			@ret = [(pred/3600), (pred%3600)/60, (pred%3600)%60, pred]
		else
			@ret = 0
		end	
	end

		#Base method for normalization
	def mainNormalization(timeSecs, distanceMi, temp, route)
		stateTime = timeSecs; #running state of time as it goes through normalization  
		#elevationTup = gatherElevationFromRoute(route)
		#stateTime = normalizeForTemperature(stateTime, temp)
		#Add more modules here(Those that deal with whole times)

		perMile = stateTime/distanceMi.to_f
		if !route.elevation_gain.nil?
			perMile = normalizeForElevationChange(route.elevation_gain, route.elevation_loss, perMile)
		end
		#Add more modules here(Those that deal with per mile times)
		return perMile
	end

	def mainExtrapolation(expTemp, route, avgPerMile)
		#perMile = getUserAverageMiTime()
		#elevationTup = gatherElevationFromRoute(route)
		if !route.elevation_gain.nil?
			perMile = extrapolateForElevationChange(route.elevation_gain, route.elevation_loss, avgPerMile)
		else
			perMile = avgPerMile
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
