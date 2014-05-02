require 'spec_helper'

describe "runs/new" do
  before(:each) do
    assign(:run, stub_model(Run).as_new_record)
  end

  it "renders new run form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", runs_path, "post" do
    end
  end
end
