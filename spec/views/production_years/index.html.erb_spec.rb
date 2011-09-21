require 'spec_helper'

describe "production_years/index.html.erb" do
  before(:each) do
    assign(:production_years, [
      stub_model(ProductionYear,
        :year => 1
      ),
      stub_model(ProductionYear,
        :year => 1
      )
    ])
  end

  it "renders a list of production_years" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
