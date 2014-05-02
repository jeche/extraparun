require 'spec_helper'

describe "runs/show" do
  before(:each) do
    @run = assign(:run, stub_model(Run))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
