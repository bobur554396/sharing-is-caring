# == Schema Information
#
# Table name: attachments
#
#  id                    :integer          not null, primary key
#  title                 :string(255)
#  description           :string(255)
#  document              :string(255)
#  micropost_id          :integer
#  created_at            :datetime
#  updated_at            :datetime
#  micropost_token       :string(255)
#  document_file_name    :string(255)
#  document_content_type :string(255)
#  document_file_size    :integer
#  document_updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
  end
end
