require 'spec_helper'

describe "issues/index.html.erb" do
  before(:each) do
    assign(:issues, [
      stub_model(Issue,
        :price => 1,
        :description => "MyText"
      ),
      stub_model(Issue,
        :price => 1,
        :description => "MyText"
      )
    ])
  end

  it "renders a list of issues" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
