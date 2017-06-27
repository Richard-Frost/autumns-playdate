class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :child_id
      t.integer :location_id
    end
  end
end