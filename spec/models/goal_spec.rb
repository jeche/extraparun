require 'spec_helper'

describe Goal do
  before { @goal = Goal.new(GoalName:"testing", gtMin:"3", gtSec:"3", gtHour:"2", predictions:"{}", Route:"Boston Marathon")}

	subject { @goal }

	it { should respond_to(:gtHour) }
	it { should respond_to(:gtMin) }
	it { should respond_to(:gtSec) }
	it { should respond_to(:GoalName) }
	it { should respond_to(:predictions) }
	it { should respond_to(:Route) }

	it { should be_valid }

	describe "when name is not present" do
		before { @goal.GoalName = "" }
		it { should_not be_valid }
	end

	describe "when hr is not present" do
		before { @goal.gtHour = "" }
		it { should_not be_valid }
	end

	describe "when min is not present" do
		before { @goal.gtMin = "" }
		it { should_not be_valid }
	end

	describe "when sec is not present" do
		before { @goal.gtSec = "" }
		it { should_not be_valid }
	end

	describe "when route is not present" do
		before { @goal.Route = "" }
		it { should_not be_valid }
	end

	describe "when hr is not numeric" do
		before { @goal.gtHour = "a" }
		it { should_not be_valid }
	end

	describe "when min is not numeric" do
		before { @goal.gtMin = "a" }
		it { should_not be_valid }
	end

	describe "when sec is not numeric" do
		before { @goal.gtSec = "a" }
		it { should_not be_valid }
	end

	describe "when hr is not an integer" do
		before { @goal.gtHour = "3.1" }
		it { should_not be_valid }
	end

	describe "when min is not an integer" do
		before { @goal.gtMin = "4.2" }
		it { should_not be_valid }
	end

	describe "when sec is not an integer" do
		before { @goal.gtSec = "5.2" }
		it { should_not be_valid }
	end
end
