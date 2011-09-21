require "spec_helper"

describe ProductionYearsController do
  describe "routing" do

    it "routes to #index" do
      get("/production_years").should route_to("production_years#index")
    end

    it "routes to #new" do
      get("/production_years/new").should route_to("production_years#new")
    end

    it "routes to #show" do
      get("/production_years/1").should route_to("production_years#show", :id => "1")
    end

    it "routes to #edit" do
      get("/production_years/1/edit").should route_to("production_years#edit", :id => "1")
    end

    it "routes to #create" do
      post("/production_years").should route_to("production_years#create")
    end

    it "routes to #update" do
      put("/production_years/1").should route_to("production_years#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/production_years/1").should route_to("production_years#destroy", :id => "1")
    end

  end
end
