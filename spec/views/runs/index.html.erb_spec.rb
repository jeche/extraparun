require 'spec_helper'

describe "runs/index" do
  before(:each) do
    assign(:runs, [
      stub_model(Run),
      stub_model(Run)
    ])
  end

  it "renders a list of runs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
