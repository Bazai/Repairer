require 'spec_helper'

describe "production_years/edit.html.erb" do
  before(:each) do
    @production_year = assign(:production_year, stub_model(ProductionYear,
      :year => 1
    ))
  end

  it "renders the edit production_year form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => production_years_path(@production_year), :method => "post" do
      assert_select "input#production_year_year", :name => "production_year[year]"
    end
  end
end
