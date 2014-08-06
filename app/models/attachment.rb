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

class Attachment < ActiveRecord::Base
  # attr_accessible :title, :description, :resource_id, :document

  belongs_to :resource
  # has_many :documents, through: :attachements, source: :document

  has_attached_file :document,
    :thumbnail => "60x60#",
    :path => ":rails_root/public/documents/:id/:filename",
    :url  => "/documents/:id/:filename"

  do_not_validate_attachment_file_type :document #why?

end
