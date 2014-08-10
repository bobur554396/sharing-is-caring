class CreateAttachmentFiles < ActiveRecord::Migration
  def change
    create_table :attachment_files do |t|
      t.string  :document
      t.integer :attachment_id
      
      t.timestamps
    end
  end
end
