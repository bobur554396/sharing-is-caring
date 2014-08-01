class AddMicropostTokenToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :micropost_token, :string
  end
end
