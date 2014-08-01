class AddTokenToMicropost < ActiveRecord::Migration
  def change
      add_column :microposts, :token, :string
  end
end
