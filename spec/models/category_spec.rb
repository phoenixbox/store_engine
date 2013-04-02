require 'spec_helper'

describe Category do

  context "#title" do 
    let!(:category){Category.create!(name:"laundry")}
    it "should get the product name" do
      expect( category.name ).to eq "laundry"  
    end
  end
end
