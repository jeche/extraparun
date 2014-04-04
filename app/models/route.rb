class Route < ActiveRecord::Base
	has_many :points, :dependent => :destroy
	belongs_to :run
end
