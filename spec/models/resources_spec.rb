# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  token      :string(255)
#

require 'spec_helper'

describe Resource do
  let(:user) { FactoryGirl.create(:user) }
  before { @resource = user.resources.build(content: "Lorem ipsum") }

  subject { @resource }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @resource.user_id = nil }
    it { should_not be_valid }
  end
end
