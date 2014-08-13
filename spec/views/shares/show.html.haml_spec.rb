require 'spec_helper'

describe "shares/show" do
  before(:each) do
    @share = assign(:share, stub_model(Share))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
