require 'spec_helper'

describe "dashboard/promotions/index" do
  before(:each) do
    assign(:dashboard_promotions, [
      stub_model(Dashboard::Promotion),
      stub_model(Dashboard::Promotion)
    ])
  end

  it "renders a list of dashboard/promotions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
