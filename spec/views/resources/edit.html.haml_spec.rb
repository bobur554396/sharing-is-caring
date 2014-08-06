require 'spec_helper'

describe "resources/edit" do
  before(:each) do
    @resource = assign(:resource, stub_model(Resource,
      :content => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit resource form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", resource_path(@resource), "post" do
      assert_select "input#resource_content[name=?]", "resource[content]"
      assert_select "input#resource_user_id[name=?]", "resource[user_id]"
    end
  end
end
