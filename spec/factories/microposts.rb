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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :micropost do
    content "MyString"
    user_id 1
  end
end
