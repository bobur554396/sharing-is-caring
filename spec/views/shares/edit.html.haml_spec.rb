require 'spec_helper'

describe "shares/edit" do
  before(:each) do
    @share = assign(:share, stub_model(Share))
  end

  it "renders the edit share form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", share_path(@share), "post" do
    end
  end
end
