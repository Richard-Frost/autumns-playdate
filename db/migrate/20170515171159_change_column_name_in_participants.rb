class ChangeColumnNameInParticipants < ActiveRecord::Migration
  def change
    change_table :participants do |t|
      t.rename :plydate_id, :playdate_id
    end
  end
end
