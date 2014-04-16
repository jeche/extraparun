class Goal < ActiveRecord::Base
	belongs_to :user
	has_one :route, :dependent => :destroy, as: :runnable
end
