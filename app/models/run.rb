class Run < ActiveRecord::Base
	belongs_to :user
	has_one :route
	validates :route_id, presence: true
	validates :user_id, presence: true
end
