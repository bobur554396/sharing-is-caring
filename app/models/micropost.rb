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
  has_many :attachments, dependent: :destroy, inverse_of: :micropost
  # has_many :documents, through: :attachments
  accepts_nested_attributes_for :attachments

  validates_presence_of :user_id, :content

  # scope :tagged, -> {where}

  # def

  def author
    User.find(self.user_id)
  end

  def has_link?
    self.content.start_with?("http://", "https://")
  end

  def content_link
    if has_link?
      self.content.match(/http:\/\/\S+/).to_s
    end
  end

  def has_attachments?
    true if self.attachments.length >= 1
  end

  def attachment_title
    if has_attachments?
      self.attachments.first.title
    end
  end

  def attachment_description
    if has_attachments?
      self.attachments.first.description
    end
  end

  def attachment_url
    if has_attachments?
      self.attachments.first.document.url
    end
  end

end
