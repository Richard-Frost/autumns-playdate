class AddColumnToPlaydates < ActiveRecord::Migration
  def change
    add_column :playdates, :datetime, :datetime
  end
end
