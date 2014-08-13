require 'spec_helper'

describe "shares/new" do
  before(:each) do
    assign(:share, stub_model(Share).as_new_record)
  end

  it "renders new share form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", shares_path, "post" do
    end
  end
end
