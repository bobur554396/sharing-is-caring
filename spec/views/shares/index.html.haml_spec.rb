require 'spec_helper'

describe "shares/index" do
  before(:each) do
    assign(:shares, [
      stub_model(Share),
      stub_model(Share)
    ])
  end

  it "renders a list of shares" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
