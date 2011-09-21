require 'spec_helper'

describe "brands/show.html.erb" do
  before(:each) do
    @brand = assign(:brand, stub_model(Brand))
  end

  it "renders attributes in <p>" do
    render
  end
end
