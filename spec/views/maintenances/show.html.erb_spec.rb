require 'spec_helper'

describe "maintenances/show.html.erb" do
  before(:each) do
    @maintenance = assign(:maintenance, stub_model(Maintenance,
      :decsription => "Decsription",
      :price => 1,
      :production_year_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Decsription/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
