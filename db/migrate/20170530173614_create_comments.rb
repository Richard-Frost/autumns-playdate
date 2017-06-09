class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :parent_id
      t.integer :playdate_id
    end
  end
end
