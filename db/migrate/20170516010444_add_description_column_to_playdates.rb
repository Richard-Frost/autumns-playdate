class AddDescriptionColumnToPlaydates < ActiveRecord::Migration
  def change
    add_column :playdates, :description, :string
  end
end
