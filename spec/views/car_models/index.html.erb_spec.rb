require 'spec_helper'

describe "car_models/index.html.erb" do
  before(:each) do
    assign(:car_models, [
      stub_model(CarModel,
        :name => "Name",
        :description => "Description"
      ),
      stub_model(CarModel,
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of car_models" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
