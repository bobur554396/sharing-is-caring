class AddAttachmentTokenToAttachmentFiles < ActiveRecord::Migration
  def change
    add_column :attachment_files, :attachment_share_token, :string
  end
end
