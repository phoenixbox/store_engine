require 'spec_helper'

describe "dashboard/promotions/edit" do
  before(:each) do
    @dashboard_promotion = assign(:dashboard_promotion, stub_model(Dashboard::Promotion))
  end

  it "renders the edit dashboard_promotion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dashboard_promotion_path(@dashboard_promotion), "post" do
    end
  end
end
