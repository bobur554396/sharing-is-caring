class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer  :author_id
      t.string   :title
      t.string   :content
      t.integer  :actable_id
      t.string   :actable_type
      
      t.timestamps
    end
    add_index :shares, :created_at
  end
end