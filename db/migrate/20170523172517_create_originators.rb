class CreateOriginators < ActiveRecord::Migration
  def change
    create_table :originators do |t|
      t.integer :parent_id
    end
  end
end
