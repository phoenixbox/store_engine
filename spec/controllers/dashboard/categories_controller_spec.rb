require 'spec_helper'

describe Dashboard::CategoriesController do
  
  before :each do 
    login_user_post("admin@admin.com", "admin")
  end

  describe "GET #index" do
    let!(:categories) { [Category.create(name: "laundry"),Category.create(name: "shelf"),Category.create(name: "shelving"),Category.create(name: "shelves")] }

    xit "populates and array of categories" do
      expect(assigns(:categories)).to match_array categories
      get :index
    end

    xit "should renders the :index view" do
      get :index
      expect( response ).to render_template :index
    end
  end

  describe "GET #show" do

    let!(:category) { Category.create(name: "laundry") }

    xit "assigns the requested category to @category" do
      get :show, id: category.id
      expect(assigns(:category)).to eq category
    end

    xit "renders the :show template" do
      get :show, id: category.id
      expect( response ).to render_template :show
    end
  end

  describe "GET #edit" do 
    let!(:category) { Category.create(name: "laundry") }

    xit "finds the category" do
      get :edit, id: category.id
      expect(assigns(:category)).to eq category
    end
  end

  describe "PUT #update" do
    let!(:category) {Category.create(name: "laundry")}
    let!(:updated_attributes) do
      {id: category.id, category: { name: "laundry", photo_url: "http://farm2.staticflickr.com/1278/764742538_bb2c9af2ce_z.jpg"}}
    end

    xit "changes the category's photo" do
      put :update, updated_attributes
      category.reload
      expect( category.photo_url ).to eq "http://farm2.staticflickr.com/1278/764742538_bb2c9af2ce_z.jpg"
    end
  end

end
