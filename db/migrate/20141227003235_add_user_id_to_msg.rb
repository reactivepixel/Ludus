class AddUserIdToMsg < ActiveRecord::Migration
  def change
    add_column :msgs, :user_id, :integer
    add_index :msgs, :user_id
  end
end
