class Course < ActiveRecord::Base
	belongs_to :runnable, :polymorphic => true
	belongs_to :route
end
