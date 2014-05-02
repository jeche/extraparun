require 'spec_helper'

describe Route do
  before { @route = Route.new(distance:"13.1", name:"Half Marathon", numPoints:5, elevation_gain:0.0, elevation_loss:0.0)}

	subject { @route }

	it { should respond_to(:distance) }
	it { should respond_to(:name) }
	it { should respond_to(:numPoints) }
	it { should respond_to(:elevation_gain) }
	it { should respond_to(:elevation_loss) }

	it { should be_valid }

	describe "when distance is not present" do
		before { @route.distance = "" }
		it { should_not be_valid }
	end

	describe "when numPoints is not present" do
		before { @route.numPoints = "" }
		it { should_not be_valid }
	end

	describe "when distance is not numeric" do
		before { @route.distance = "a" }
		it { should_not be_valid }
	end

	describe "when numPoints is not numeric" do
		before { @route.numPoints = "a" }
		it { should_not be_valid }
	end

	describe "when numPoints is not an integer" do
		before { @route.numPoints = "3.1" }
		it { should_not be_valid }
	end
end
