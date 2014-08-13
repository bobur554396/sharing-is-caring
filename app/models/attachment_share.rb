# == Schema Information
#
# Table name: attachment_shares
#
#  id    :integer          not null, primary key
#  token :string(255)
#

class AttachmentShare < ActiveRecord::Base
  
  acts_as :share #MTI: Attachment IS-A Share; belongs_to author (User)1
  # belongs_to :author, class_name: "User"

  has_many :attachment_files, :dependent => :destroy, inverse_of: :attachment_share
  accepts_nested_attributes_for :attachment_files
  


  


end
