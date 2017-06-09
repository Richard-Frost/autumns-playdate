class ChangeChildrenColumnName < ActiveRecord::Migration
  def change
    change_table :children do |t|
      t.rename :playdates_id, :playdate_id
    end
  end
end
