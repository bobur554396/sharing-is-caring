# == Schema Information
#
# Table name: link_shares
#
#  id :integer          not null, primary key
#

class LinkShare < ActiveRecord::Base
  acts_as :share #belongs to author (User)
  # belongs_to :author, class_name: "User"
  
  def validate_content_url
    #something here for validating format of super :content when it's a Link followed by tags
  end
end
