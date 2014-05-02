require 'spec_helper'

describe Run do
  	before { @run = Run.new(hr:"3", min:"3", sec:"3", temp:"95", humidity:"30", name:"testing", date:"05/03/2014")}

	subject { @run }

	it { should respond_to(:hr) }
	it { should respond_to(:min) }
	it { should respond_to(:sec) }
	it { should respond_to(:temp) }
	it { should respond_to(:humidity) }
	it { should respond_to(:name) }
	it { should respond_to(:date) }

	it { should be_valid }

	describe "when name is not present" do
		before { @run.name = "" }
		it { should_not be_valid }
	end

	describe "when hr is not present" do
		before { @run.hr = "" }
		it { should_not be_valid }
	end

	describe "when min is not present" do
		before { @run.min = "" }
		it { should_not be_valid }
	end

	describe "when sec is not present" do
		before { @run.sec = "" }
		it { should_not be_valid }
	end

	describe "when date is not present" do
		before { @run.date = "" }
		it { should_not be_valid }
	end

	describe "when hr is not numeric" do
		before { @run.hr = "a" }
		it { should_not be_valid }
	end

	describe "when min is not numeric" do
		before { @run.min = "a" }
		it { should_not be_valid }
	end

	describe "when sec is not numeric" do
		before { @run.sec = "a" }
		it { should_not be_valid }
	end

	describe "when temp is not numeric" do
		before { @run.temp = "a" }
		it { should_not be_valid }
	end

	describe "when humidity is not numeric" do
		before { @run.humidity = "a" }
		it { should_not be_valid }
	end

	describe "when hr is not an integer" do
		before { @run.hr = "3.1" }
		it { should_not be_valid }
	end

	describe "when min is not an integer" do
		before { @run.min = "4.2" }
		it { should_not be_valid }
	end

	describe "when sec is not an integer" do
		before { @run.sec = "5.2" }
		it { should_not be_valid }
	end
end