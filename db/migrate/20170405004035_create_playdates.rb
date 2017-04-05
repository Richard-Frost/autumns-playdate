class CreatePlaydates < ActiveRecord::Migration
  
  def change
    create_table :playdates do |t|
      t.string :name
      t.string :location
      t.integer :parents_id
      t.integer :children_id
    end
  end
end
