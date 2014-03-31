class RunsController < ApplicationController
	def new
		@run = Run.new
	end

	def index
		@runs = Run.all
	end

	def create
		@run = Run.new(run_params)
		@run.save
		route_string =  params[:route]
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
		@run.route = @route
		redirect_to @run
	end

	def show
	  @run = Run.find(params[:id])
	end

	private
	  def run_params
		params.require(:run).permit(:hr, :min, :sec, :temp, :humidity, :name, :dist, :date)
	  end
end
