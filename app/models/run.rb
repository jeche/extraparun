class Run < ActiveRecord::Base
	has_one :route
	belongs_to :user
end
