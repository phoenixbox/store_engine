require 'spec_helper'

describe "addresses/new" do
  before(:each) do
    assign(:address, stub_model(Address,
      :full_name => "MyString",
      :address_line_1 => "MyString",
      :address_line_2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zipcode => "MyString",
      :phone_number => "MyString",
      :user => nil
    ).as_new_record)
  end

  it "renders new address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", addresses_path, "post" do
      assert_select "input#address_full_name[name=?]", "address[full_name]"
      assert_select "input#address_address_line_1[name=?]", "address[address_line_1]"
      assert_select "input#address_address_line_2[name=?]", "address[address_line_2]"
      assert_select "input#address_city[name=?]", "address[city]"
      assert_select "input#address_state[name=?]", "address[state]"
      assert_select "input#address_zipcode[name=?]", "address[zipcode]"
      assert_select "input#address_phone_number[name=?]", "address[phone_number]"
      assert_select "input#address_user[name=?]", "address[user]"
    end
  end
end
