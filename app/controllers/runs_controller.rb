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
