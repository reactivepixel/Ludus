class AddUserColor < ActiveRecord::Migration
  def change
  	add_column :users, :color, :string
  end
end
