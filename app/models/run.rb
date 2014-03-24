class Run < ActiveRecord::Base
	belongs_to :user
	has_one :route
end
