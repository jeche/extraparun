class Route < ActiveRecord::Base
	has_many :points
	belongs_to :run
end
