class Run < ActiveRecord::Base
	has_one :route, :dependent => :destroy
	belongs_to :user
end
