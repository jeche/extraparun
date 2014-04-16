class Run < ActiveRecord::Base
	has_one :route, :dependent => :destroy, as: :runnable 
	belongs_to :user
end
