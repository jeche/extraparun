class RunsController < ApplicationController
	def new
		@run = Run.new
	end
	def create
	  @run = Run.new(params[:run])
	  @run.save
	  redirect_to @run
	end
	def show
	  @run = Run.find(params[:id])
	end
	private
	  def post_params
		params.require(:run).permit(:hr, :min, :sec)
	  end
end
