class Run < ActiveRecord::Base
	has_many :courses, :dependent => :destroy, as: :runnable 
	has_many :routes, :through => :courses
	belongs_to :user
	validates :name, presence: true
	validates :date, presence: true
	validates :hr, presence: true
	validates :min, presence: true
	validates :sec, presence: true
end
