class AddValueToMove < ActiveRecord::Migration
  def change
    add_column :moves, :value, :integer
  end
end
