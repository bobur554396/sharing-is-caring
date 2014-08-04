class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :title
      t.string :description
      t.string :document
      t.integer :micropost_id

      t.timestamps
    end
  end
end
