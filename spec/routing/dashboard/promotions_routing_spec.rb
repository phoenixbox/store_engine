require "spec_helper"

describe Dashboard::PromotionsController do
  describe "routing" do

    it "routes to #index" do
      get("/dashboard/promotions").should route_to("dashboard/promotions#index")
    end

    it "routes to #new" do
      get("/dashboard/promotions/new").should route_to("dashboard/promotions#new")
    end

    it "routes to #show" do
      get("/dashboard/promotions/1").should route_to("dashboard/promotions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/dashboard/promotions/1/edit").should route_to("dashboard/promotions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/dashboard/promotions").should route_to("dashboard/promotions#create")
    end

    it "routes to #update" do
      put("/dashboard/promotions/1").should route_to("dashboard/promotions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/dashboard/promotions/1").should route_to("dashboard/promotions#destroy", :id => "1")
    end

  end
end
