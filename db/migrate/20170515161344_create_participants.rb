class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :parent_id
      t.integer :child_id
      t.integer :plydate_id
    end
  end
end
