# == Schema Information
#
# Table name: attachments
#
#  id    :integer          not null, primary key
#  token :string(255)
#

class Attachment < ActiveRecord::Base
  
  acts_as :share #MTI: Attachment IS-A Share; belongs_to author (User)1
  # belongs_to :author, class_name: "User"

  has_many :attachment_files, :dependent => :destroy, inverse_of: :attachment
  accepts_nested_attributes_for :attachment_files
  


  


end
