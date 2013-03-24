require 'spec_helper'

describe CategoriesController do 

  describe 'GET #index' do 
    let!(:categories) { [ Category.create(name:"tag1") ] }

    it "populates an array of categories" do 
      get :index
      expect( assigns(:categories) ).to match_array categories
    end
  end

  describe 'GET #show' do
    let!(:category) { Category.create(name:"tag1" ) }
    it "finds a category" do
      get :show, id: category.id
      expect( assigns(:category) ).to eq category
      expect( response ).to render_template :show
    end
  end

end
