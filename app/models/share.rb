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

  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :content

  # def self.new_share(share_type)
  #   case share_type
  #   when 
  # end

  
end
