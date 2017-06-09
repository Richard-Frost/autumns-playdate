class AddColumnsToPlaydate < ActiveRecord::Migration
  def change
    add_column :playdates, :date, :string
    add_column :playdates, :time, :string
  end
end
