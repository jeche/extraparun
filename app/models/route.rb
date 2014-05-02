class Route < ActiveRecord::Base
	has_many :points, :dependent => :destroy
	has_many :courses, :dependent => :destroy
	has_many :runs, :through => :courses, :source => :runnable, :source_type => "Run"
	has_many :goals, :through => :courses, :source => :runnable, :source_type => "Goal"
	validates_presence_of :distance, :numPoints
	validates_numericality_of	:distance
	validates_numericality_of	:numPoints , :only_integer => true
end
