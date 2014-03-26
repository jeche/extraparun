class TestingController < ApplicationController
	def map
	end

	def magic
		route_string =  params[:route]
		route_string = route_string.gsub(/[()]/, "")
		lat_lon_list = route_string.split(",")
		count = 0
		orderNum = 0
		route = Route.new(:distance => params[:distance])
		route.save
		while count < lat_lon_list.size
			route.points.create(:lat => lat_lon_list[count].to_f, :lon => lat_lon_list[count + 1].to_f, :orderNum => orderNum)
			count += 2
			orderNum += 1
		end
	end
end
