require 'spec_helper'

describe "dashboard/promotions/show" do
  before(:each) do
    @dashboard_promotion = assign(:dashboard_promotion, stub_model(Dashboard::Promotion))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
