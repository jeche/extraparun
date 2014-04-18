class Run < ActiveRecord::Base
	has_many :courses, :dependent => :destroy, as: :runnable 
	has_many :routes, :through => :courses
	belongs_to :user
end
