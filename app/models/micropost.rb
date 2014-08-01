# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  token      :string(255)
#

class Micropost < ActiveRecord::Base
  # attr_accessible :content, :user_id, :documents
  include SimpleHashtag::Hashtaggable


  hashtaggable_attribute :content
  belongs_to :user
  has_many :attachments, dependent: :destroy

  validates_presence_of :user_id, :content

  def author
    User.find(self.user_id)
  end
end
