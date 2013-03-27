require 'spec_helper'

describe "addresses/index" do
  before(:each) do
    assign(:addresses, [
      stub_model(Address,
        :full_name => "Full Name",
        :address_line_1 => "Address Line 1",
        :address_line_2 => "Address Line 2",
        :city => "City",
        :state => "State",
        :zipcode => "Zipcode",
        :phone_number => "Phone Number",
        :user => nil
      ),
      stub_model(Address,
        :full_name => "Full Name",
        :address_line_1 => "Address Line 1",
        :address_line_2 => "Address Line 2",
        :city => "City",
        :state => "State",
        :zipcode => "Zipcode",
        :phone_number => "Phone Number",
        :user => nil
      )
    ])
  end

  it "renders a list of addresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address Line 1".to_s, :count => 2
    assert_select "tr>td", :text => "Address Line 2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
