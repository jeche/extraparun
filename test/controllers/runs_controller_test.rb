require 'test_helper'

class RunsControllerTest < ActionController::TestCase

	test "should_get_new" do
		get :new
		assert_response :success
		assert_not_nil assigns(@run)
	end

	test "should_get_index" do
		@old_controller = @controller
		login
		@controller = @old_controller
		get :index
		assert_response :success
		assert_nil assigns(@runs)
	end

end
