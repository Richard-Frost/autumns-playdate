class CreateParents < ActiveRecord::Migration
  
  def change
    create_table :parents do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.integer :playdate_id
    end
  end
end
