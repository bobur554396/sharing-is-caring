class AddTokenToResource < ActiveRecord::Migration
  def change
      add_column :resources, :token, :string
  end
end
