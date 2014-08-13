require 'spec_helper'

describe "resources/new" do
  before(:each) do
    assign(:resource, stub_model(Resource,
      :content => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new resource form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", resources_path, "post" do
      assert_select "input#resource_content[name=?]", "resource[content]"
      assert_select "input#resource_user_id[name=?]", "resource[user_id]"
    end
  end
end
