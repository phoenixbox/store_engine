require 'spec_helper'

describe "dashboard/promotions/new" do
  before(:each) do
    assign(:dashboard_promotion, stub_model(Dashboard::Promotion).as_new_record)
  end

  it "renders new dashboard_promotion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dashboard_promotions_path, "post" do
    end
  end
end
