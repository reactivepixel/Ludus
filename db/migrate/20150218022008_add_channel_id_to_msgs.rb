class AddChannelIdToMsgs < ActiveRecord::Migration
  def change
    add_column :msgs, :channel_id, :integer, null: false
    add_index :msgs, :channel_id
  end
end
