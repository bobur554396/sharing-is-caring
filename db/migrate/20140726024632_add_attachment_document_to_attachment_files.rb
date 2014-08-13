class AddAttachmentDocumentToAttachmentFiles < ActiveRecord::Migration
  def self.up
    change_table :attachment_files do |t|
      t.attachment :document
    end
  end

  def self.down
    drop_attached_file :attachment_files, :document
  end
end
