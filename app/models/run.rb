class Run < ActiveRecord::Base
	has_many :courses, :dependent => :destroy, as: :runnable 
	has_many :routes, :through => :courses
	belongs_to :user
	validates_presence_of :name, :date, :hr, :min, :sec
	validates_numericality_of   :hr, :only_integer => true
	validates_numericality_of   :min, :only_integer => true
	validates_numericality_of   :sec, :only_integer => true
	validates_numericality_of   :temp
	validates_numericality_of   :humidity
end
