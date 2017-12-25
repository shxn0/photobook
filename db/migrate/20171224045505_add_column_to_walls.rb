class AddColumnToWalls < ActiveRecord::Migration
  def change
    add_column :walls, :title, :string
    add_column :walls, :content, :text
  end
end
