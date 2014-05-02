require 'spec_helper'

describe "runs/edit" do
  before(:each) do
    @run = assign(:run, stub_model(Run))
  end

  it "renders the edit run form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", run_path(@run), "post" do
    end
  end
end
