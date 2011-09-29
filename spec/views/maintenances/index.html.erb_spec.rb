require 'spec_helper'

describe "maintenances/index.html.erb" do
  before(:each) do
    assign(:maintenances, [
      stub_model(Maintenance,
        :decsription => "Decsription",
        :price => 1,
        :production_year_id => 1
      ),
      stub_model(Maintenance,
        :decsription => "Decsription",
        :price => 1,
        :production_year_id => 1
      )
    ])
  end

  it "renders a list of maintenances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Decsription".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
