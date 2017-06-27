class RemoveColumns < ActiveRecord::Migration
  def change
    remove_column :parents, :playdate_id
    remove_column :children, :playdate_id
    remove_column :playdates, :parents_id
    remove_column :playdates, :children_id
  end
end
