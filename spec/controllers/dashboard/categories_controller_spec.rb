require 'spec_helper'

describe Dashboard::CategoriesController do

  describe "GET #index" do
    let!(:categories) { [Category.create(name: "laundry")] }

    it "populates and array of categories" do
      get :index
      expect(assigns(:categories)).to match_array categories
    end

    it "should renders the :index view" do
      get :index
      expect( response ).to render_template :index
    end
  end

  describe "GET #show" do

    let!(:category) { Category.create(name: "laundry") }

    it "assigns the requested category to @category" do
      get :show, id: category.id
      expect(assigns(:category)).to eq category
    end

    it "renders the :show template" do
      get :show, id: category.id
      expect( response ).to render_template :show
    end
  end

end
