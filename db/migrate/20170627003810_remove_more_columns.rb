class RemoveMoreColumns < ActiveRecord::Migration
  def change
    remove_column :playdates, :child_id
    remove_column :playdates, :parent_id
    remove_column :playdates, :date
    remove_column :playdates, :time
    remove_column :parents, :phone_number
    drop_table :originators
  end
end
