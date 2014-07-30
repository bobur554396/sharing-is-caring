# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Micropost < ActiveRecord::Base
  include SimpleHashtag::Hashtaggable
  hashtaggable_attribute :content
  belongs_to :user

  validates_presence_of :user_id, :content

  def author
    User.find(self.user_id)
  end
end
