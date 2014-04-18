class Goal < ActiveRecord::Base
	belongs_to :user
	has_many :courses, :dependent => :destroy, as: :runnable
	has_many :routes, :through => :courses
end
