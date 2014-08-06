class AddResourceTokenToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :resource_token, :string
  end
end
