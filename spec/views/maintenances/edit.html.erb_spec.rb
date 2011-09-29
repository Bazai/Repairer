require 'spec_helper'

describe "maintenances/edit.html.erb" do
  before(:each) do
    @maintenance = assign(:maintenance, stub_model(Maintenance,
      :decsription => "MyString",
      :price => 1,
      :production_year_id => 1
    ))
  end

  it "renders the edit maintenance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => maintenances_path(@maintenance), :method => "post" do
      assert_select "input#maintenance_decsription", :name => "maintenance[decsription]"
      assert_select "input#maintenance_price", :name => "maintenance[price]"
      assert_select "input#maintenance_production_year_id", :name => "maintenance[production_year_id]"
    end
  end
end
