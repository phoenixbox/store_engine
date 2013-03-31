require 'spec_helper'

describe Product do 
  context "When it has a name, description, price" do 
    let(:subject) { Product.new(title:"productname", long_description:"productdescription", price: "12.34")}

    it "is valid" do 
      expect( subject ).to be_valid
    end

    it "should not be valid wihout a title" do
      subject.title = nil
      expect( subject ).to be_invalid
    end

    it "should not be valid wihout a price" do
      subject.price = nil
      expect( subject ).to be_invalid
    end

  end
end
