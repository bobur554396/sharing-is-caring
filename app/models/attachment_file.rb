# == Schema Information
#
# Table name: attachment_files
#
#  id                     :integer          not null, primary key
#  document               :string(255)
#  attachment_share_id    :integer
#  created_at             :datetime
#  updated_at             :datetime
#  attachment_share_token :string(255)
#  document_file_name     :string(255)
#  document_content_type  :string(255)
#  document_file_size     :integer
#  document_updated_at    :datetime
#

class AttachmentFile < ActiveRecord::Base

  belongs_to :attachment_share

  has_attached_file :document, 
    :path => ":rails_root/public/documents/:id/:filename",
    :url  => "/documents/:id/:filename"

  do_not_validate_attachment_file_type :document

end
