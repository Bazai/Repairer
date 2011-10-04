require "spec_helper"

describe LaborsController do
  describe "routing" do

    it "routes to #index" do
      get("/labors").should route_to("labors#index")
    end

    it "routes to #new" do
      get("/labors/new").should route_to("labors#new")
    end

    it "routes to #show" do
      get("/labors/1").should route_to("labors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/labors/1/edit").should route_to("labors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/labors").should route_to("labors#create")
    end

    it "routes to #update" do
      put("/labors/1").should route_to("labors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/labors/1").should route_to("labors#destroy", :id => "1")
    end

  end
end
