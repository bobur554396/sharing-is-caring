# == Schema Information
#
# Table name: attachments
#
#  id                    :integer          not null, primary key
#  title                 :string(255)
#  description           :string(255)
#  document              :string(255)
#  resource_id          :integer
#  created_at            :datetime
#  updated_at            :datetime
#  resource_token       :string(255)
#  document_file_name    :string(255)
#  document_content_type :string(255)
#  document_file_size    :integer
#  document_updated_at   :datetime
#

require 'spec_helper'

describe Attachment do
  pending "add some examples to (or delete) #{__FILE__}"
end
