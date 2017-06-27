class AddColumnToCheckins < ActiveRecord::Migration
  def change
    add_column :checkins, :parent_id, :integer 
  end
end
