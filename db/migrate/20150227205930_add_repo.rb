class AddRepo < ActiveRecord::Migration
  def change
  	add_column :users, :repo_name, :string
  end
end
