require 'spec_helper'

describe "car_models/edit.html.erb" do
  before(:each) do
    @car_model = assign(:car_model, stub_model(CarModel,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit car_model form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => car_models_path(@car_model), :method => "post" do
      assert_select "input#car_model_name", :name => "car_model[name]"
      assert_select "input#car_model_description", :name => "car_model[description]"
    end
  end
end
