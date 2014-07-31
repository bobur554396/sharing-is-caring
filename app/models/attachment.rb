# == Schema Information
#
# Table name: attachments
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#


class Attachment < ActiveRecord::Base
  belongs_to :micropost
end
