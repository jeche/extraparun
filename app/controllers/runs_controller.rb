class RunsController < ApplicationController
	before_action :signed_in_user
	before_action :correct_user, only: [:show, :edit, :destroy, :update]

	def new
		@run = Run.new
	end

	def index
		@runs = Run.all
	end

	def create
		@run = current_user.runs.new(run_params)
		@run.save
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
		@route.runnable_id = @run.id
		@route.save
		@run.routes.push(@route)
		if !current_user.goals.nil?
			for goal in current_user.goals
				predict(@run.date, goal.id)
			end
		end
		redirect_to @run
	end

	def show
	  @run = Run.find(params[:id])
	end

	def destroy
  		@run = Run.find(params[:id])
  		@run.routes.first.destroy
  		@run.destroy
  		redirect_to runs_path
	end

	def edit
  		@run = Run.find(params[:id])
  		@points = Array.new
  		count = 0 
  		while count < @run.routes.first.numPoints
  			point = Point.find_by route_id: @run.routes.first.id, orderNum: count
  			@points.push('(' + point.lat.to_s + ', ' + point.lon.to_s + ')')
  			count += 1
  		end
  		@distance = @run.routes.first.distance
	end

	def update
  		@run = Run.find(params[:id])
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
		@route.runnable_id = @run.id
		@route.save
		if !@run.routes.first.nil?
			oldRoute = @run.routes.shift
			oldRoute.destroy
		end
		@run.routes.push(@route)
		if !current_user.goals.nil?
			for goal in current_user.goals
				predict(@run.date, goal.id)
			end
		end
  		if @run.update(params[:run].permit(:hr, :min, :sec, :temp, :humidity, :name, :dist, :date))
    		redirect_to @run
  		else
    		render 'edit'
  		end
	end

	def correct_user
      @run = current_user.runs.find_by(id: params[:id])
      if @run.nil?
      	flash[:badBoy] = "Bad bad bad.  That's not yours!"
      	redirect_to root_url if @run.nil?
      end
    end

	private
	  def run_params
		params.require(:run).permit(:hr, :min, :sec, :temp, :humidity, :name, :dist, :date)
	  end
end
