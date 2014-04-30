require 'test_helper'

class RunTest < ActiveSupport::TestCase
	test "should_not_save_without_name" do 
		run = Run.new(:date => "5/3/1992", :hr => 5, :min => 6, :sec => 7, :user_id => 5)
		assert_not run.save, "Saved the run without a name"
	end

	test "should_not_save_without_date" do
		run = Run.new(:name => "New Run", :hr => 5, :min => 6, :sec => 7, :user_id => 5)
		assert_not run.save, "Saved the run without a date"
	end

	test "should_not_save_without_hr" do
		run = Run.new(:name => "New Run", :date => "5/3/1992", :min => 6, :sec => 7, :user_id => 5)
		assert_not run.save, "Saved the run without a hr"
	end

	test "should_not_save_without_min" do
		run = Run.new(:name => "New Run", :date => "5/3/1992", :hr => 6, :sec => 7, :user_id => 5)
		assert_not run.save, "Saved the run without a min"
	end

	test "should_not_save_without_sec" do
		run = Run.new(:name => "New Run", :date => "5/3/1992", :min => 6, :hr => 7, :user_id => 5)
		assert_not run.save, "Saved the run without a sec"
	end
end
