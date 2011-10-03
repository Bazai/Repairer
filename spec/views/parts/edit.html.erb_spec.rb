require 'spec_helper'

describe "parts/edit.html.erb" do
  before(:each) do
    @part = assign(:part, stub_model(Part,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit part form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => parts_path(@part), :method => "post" do
      assert_select "input#part_name", :name => "part[name]"
      assert_select "input#part_description", :name => "part[description]"
    end
  end
end
