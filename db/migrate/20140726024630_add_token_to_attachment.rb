class AddTokenToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :token, :string
  end
end
