require 'spec_helper'

describe "brands/index.html.erb" do
  before(:each) do
    assign(:brands, [
      stub_model(Brand),
      stub_model(Brand)
    ])
  end

  it "renders a list of brands" do
    render
  end
end
