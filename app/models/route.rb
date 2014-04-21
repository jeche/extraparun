class Route < ActiveRecord::Base
	has_many :points, :dependent => :destroy
	has_many :courses, :dependent => :destroy
	has_many :runs, :through => :courses, :source => :runnable, :source_type => "Run"
	has_many :goals, :through => :courses, :source => :runnable, :source_type => "Goal"
	validates :distance, presence: true
	validates_numericality_of	:distance
end
