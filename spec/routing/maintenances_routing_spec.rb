require "spec_helper"

describe MaintenancesController do
  describe "routing" do

    it "routes to #index" do
      get("/maintenances").should route_to("maintenances#index")
    end

    it "routes to #new" do
      get("/maintenances/new").should route_to("maintenances#new")
    end

    it "routes to #show" do
      get("/maintenances/1").should route_to("maintenances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/maintenances/1/edit").should route_to("maintenances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/maintenances").should route_to("maintenances#create")
    end

    it "routes to #update" do
      put("/maintenances/1").should route_to("maintenances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/maintenances/1").should route_to("maintenances#destroy", :id => "1")
    end

  end
end
