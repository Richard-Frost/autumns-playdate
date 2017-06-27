class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :child_id
      t.integer :location_id
      t.integer :parent_id
    end
  end
end