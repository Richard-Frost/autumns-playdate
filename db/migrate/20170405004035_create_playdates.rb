class CreatePlaydates < ActiveRecord::Migration
  
  def change
    create_table :playdates do |t|
      t.string :name
      t.string :location
      t.string :description
      t.datetime :datetime
      t.integer :originator
    end
  end
end

