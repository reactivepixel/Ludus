class AddTopic < ActiveRecord::Migration
  def change
  	add_column :channels, :topic, :string
  end
end
