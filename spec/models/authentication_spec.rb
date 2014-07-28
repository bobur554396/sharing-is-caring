# == Schema Information
#
# Table name: authentications
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  provider      :string(255)      not null
#  proid         :string(255)      not null
#  token         :string(255)
#  refresh_token :string(255)
#  secret        :string(255)
#  expires_at    :datetime
#  username      :string(255)
#  image_url     :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Authentication do
  let(:authentication) {FactoryGirl.build(:authentication)}
  pending "add some examples to (or delete) #{__FILE__}"
  # todo: check loading of oath_data and default_scope
end
