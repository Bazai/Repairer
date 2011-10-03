require 'spec_helper'

describe "labors/new.html.erb" do
  before(:each) do
    assign(:labor, stub_model(Labor,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new labor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => labors_path, :method => "post" do
      assert_select "input#labor_name", :name => "labor[name]"
      assert_select "input#labor_description", :name => "labor[description]"
    end
  end
end
