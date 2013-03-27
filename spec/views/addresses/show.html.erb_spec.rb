require 'spec_helper'

describe "addresses/show" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :full_name => "Full Name",
      :address_line_1 => "Address Line 1",
      :address_line_2 => "Address Line 2",
      :city => "City",
      :state => "State",
      :zipcode => "Zipcode",
      :phone_number => "Phone Number",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Full Name/)
    rendered.should match(/Address Line 1/)
    rendered.should match(/Address Line 2/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Zipcode/)
    rendered.should match(/Phone Number/)
    rendered.should match(//)
  end
end
