require 'spec_helper'

describe Product do 
  context "When it has a name, description, price" do 
    let(:subject) { Product.new(title:"productname", description:"productdescription", price: "12.34")}

    it "is valid" do 
      expect( subject ).to be_valid
    end

  end
end
