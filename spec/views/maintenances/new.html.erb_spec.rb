require 'spec_helper'

describe "maintenances/new.html.erb" do
  before(:each) do
    assign(:maintenance, stub_model(Maintenance,
      :decsription => "MyString",
      :price => 1,
      :production_year_id => 1
    ).as_new_record)
  end

  it "renders new maintenance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => maintenances_path, :method => "post" do
      assert_select "input#maintenance_decsription", :name => "maintenance[decsription]"
      assert_select "input#maintenance_price", :name => "maintenance[price]"
      assert_select "input#maintenance_production_year_id", :name => "maintenance[production_year_id]"
    end
  end
end
