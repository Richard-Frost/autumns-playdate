class CreateParents < ActiveRecord::Migration
  
  def change
    create_table :parents do |t|
      t.string :mom
      t.string :mom_email
      t.integer :mom_phone
      t.string :dad
      t.string :dad_email
      t.integer :dad_phone
      t.integer :child_id
      t.integer :playdate_id
    end
  end
end
