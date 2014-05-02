class Goal < ActiveRecord::Base
	serialize :predictions, Hash
	belongs_to :user
	has_many :courses, :dependent => :destroy, as: :runnable
	has_many :routes, :through => :courses
	validates_presence_of :GoalName, :Route, :gtHour, :gtMin, :gtSec
	validates_numericality_of   :gtHour, :only_integer => true
	validates_numericality_of   :gtMin, :only_integer => true
	validates_numericality_of   :gtSec, :only_integer => true
end
