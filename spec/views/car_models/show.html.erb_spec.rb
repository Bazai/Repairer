require 'spec_helper'

describe "car_models/show.html.erb" do
  before(:each) do
    @car_model = assign(:car_model, stub_model(CarModel,
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
  end
end
