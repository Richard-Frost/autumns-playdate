class FixColumnNames < ActiveRecord::Migration
  def change
    change_table :playdates do |t|
      t.rename :parents_id, :parent_id
      t.rename :children_id, :child_id
    end
  end
end

