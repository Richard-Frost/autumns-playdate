class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.integer :age
      t.integer :parents_id
      t.integer :playdates_id
    end
  end
end
