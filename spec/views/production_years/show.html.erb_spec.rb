require 'spec_helper'

describe "production_years/show.html.erb" do
  before(:each) do
    @production_year = assign(:production_year, stub_model(ProductionYear,
      :year => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
