class AddOriginatorToPlaydates < ActiveRecord::Migration
  def change
    add_column :playdates, :originator, :integer
  end
end
