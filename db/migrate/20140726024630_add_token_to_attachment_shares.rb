class AddTokenToAttachmentShares < ActiveRecord::Migration
  def change
    add_column :attachment_shares, :token, :string
  end
end
