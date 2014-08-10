# == Schema Information
#
# Table name: shares
#
#  id           :integer          not null, primary key
#  author_id    :integer
#  title        :string(255)
#  content      :string(255)
#  actable_id   :integer
#  actable_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Share < ActiveRecord::Base
  actable


  belongs_to :author, class_name: "User"
  validates_presence_of :author_id, :title, :content
  # has_many :files, through: :attachments
  # has_many :files, dependent: :destroy
  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :content
  
  
  # has_many :attachments, foreign_key: :attachment_share_id, dependent: :destroy
  
  
  # has_many :attached_files, class_name: "Attachment", foreign_key: :attachment_share_id, dependent: :destroy
  

  

  
end
