class Route < ActiveRecord::Base
	has_many :points, :dependent => :destroy
	belongs_to :runnable, polymorphic: true
end
